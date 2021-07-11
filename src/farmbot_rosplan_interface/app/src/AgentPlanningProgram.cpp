#include "app/AgentPlanningProgram.h"

namespace kharsair::APP
{

    AgentPlanningProgram::AgentPlanningProgram(std::string fileName, bool& construct_app_success)
    {
        construct_app_success = parse_from_file(fileName);
    }



    std::ostream& operator<<(std::ostream& os, AgentPlanningProgram::Predicate& predicate)
    {
        os << "\t\t\tpredicate name : " << predicate.predicate_name << '\n';
        os << "\t\t\tparameters : { \n ";
        for (auto& each_parameter : predicate.parameters)
            os << "\t\t\t\t" << each_parameter.key << ':' << each_parameter.value << '\n';
        os << "\t\t\t}" << '\n';

        return os;
    }


    std::ostream& operator<<(std::ostream& os, const AgentPlanningProgram& app)
    {
        os << "APP: " << '\n' << "States: " << '\n';
        for (auto& each_state: app.m_states)
        {
            os << "\tState name: " << each_state.first << " : " << each_state.second->state_name << '\n';
            os << "\t\t" << "Available Transition : \n" ;
            for (auto& e_a_t : each_state.second->available_transition)
            {
                os << "\t\t\t" << e_a_t->transition_name << ' ' << e_a_t->start_state->state_name << " =====> " << e_a_t->end_state->state_name << '\n';
            }
        }


        os << '\n' << "Transition: " << '\n';
        for (auto& each_transition: app.m_transitions)
            os << *each_transition << "\n\n";
        os << '\n';
        return os;
    }

    std::ostream& operator<<(std::ostream& os, AgentPlanningProgram::APP_Transition& transition)
    {
        os << '\t' << "name : " << transition.transition_name << '\n';
        os << '\t' << "startState : " << transition.start_state->state_name << '\n';
        os << '\t' << "endState : " << transition.end_state->state_name << '\n';

        os << '\t' << "guards : [\n"  ;
        for (auto& each_guard: transition.guards)
            os << each_guard;
        os << "\t\t]" << '\n';

        os << '\t' << "maintenance goals : [\n"  ;
        for (auto& each_guard: transition.maintenance_goals)
            os << each_guard;
        os << "\t\t]" << '\n';

        os << '\t' << "achievement goals : [\n"  ;
        for (auto& each_guard: transition.achievement_goals)
            os << each_guard;
        os << "\t\t]" << '\n';
        return os;

    }

    void AgentPlanningProgram::help_populate_predicates(std::vector<Predicate> &predicate_list, rapidjson::Value &predicate_values)
    {
        assert(predicate_values.IsArray());
        for (rapidjson::SizeType i = 0; i < predicate_values.Size(); i ++)
        {
            assert(predicate_values[i].IsObject());
            Predicate temp;
            temp.predicate_name = predicate_values[i]["predicate"].GetString();

            assert(predicate_values[i]["parameters"].IsObject());

            for (rapidjson::Value::ConstMemberIterator itr = predicate_values[i]["parameters"].MemberBegin(); itr != predicate_values[i]["parameters"].MemberEnd(); ++itr)
            {
                vStr2d v;
                v.key = itr->name.GetString();
                v.value = predicate_values[i]["parameters"][itr->name.GetString()].GetString();
                temp.parameters.push_back(v);

            }

            predicate_list.push_back(temp);

        }

    }

    bool AgentPlanningProgram::parse_from_file(std::string& fileName)
    {

        std::ifstream file(fileName);

        if (!file.is_open())
        {
            std::cerr << "Error !" << std::endl;

            return false;
        }

        std::string content((std::istreambuf_iterator<char>(file)),
                            (std::istreambuf_iterator<char>()));


        rapidjson::Document document;

        if (document.Parse(content.c_str()).HasParseError())
        {
            std::cout << "json parsing error!" << std::endl;
            return false;
        }

        rapidjson::Value& States = document["States"];
        rapidjson::Value& Transitions = document["Transitions"];

        assert(States.IsArray());
        assert(Transitions.IsArray());


        for (rapidjson::SizeType i = 0; i < States.Size(); i ++)
        {
            assert(States[i].IsString());
            auto* temp = new APP_State;
            temp->state_name = States[i].GetString();
            temp->available_transition = {};
            m_states.insert({States[i].GetString(), temp});

            if (i == 0) // first state in the state list of the json file is the default initial state
                m_current_state_ptr = temp;
        }

        std::cout << "finish adding states" << '\n';

        for (rapidjson::SizeType j = 0; j < Transitions.Size(); j ++)
        {
            assert(Transitions[j].IsObject());
            auto *temp = new APP_Transition;
            temp->transition_name = Transitions[j]["name"].GetString();

            temp->start_state = m_states.find(Transitions[j]["StartState"].GetString())->second;
            temp->end_state = m_states.find(Transitions[j]["EndState"].GetString())->second;

            temp->guards = {}; temp->maintenance_goals = {}; temp->achievement_goals = {};

            help_populate_predicates(temp->guards, Transitions[j]["Guards"]);
            help_populate_predicates(temp->maintenance_goals, Transitions[j]["MaintenanceGoals"]);
            help_populate_predicates(temp->achievement_goals, Transitions[j]["AchievementGoals"]);

            temp->start_state->available_transition.push_back(temp);

            m_transitions.push_back(temp);




        }

        std::cout << "finish adding transition" << '\n';

        return true;

    }

    void AgentPlanningProgram::set_current_state(const std::string& state_name)
    {
        m_current_state_ptr = m_states.find(state_name)->second;
    }

    AgentPlanningProgram::APP_State* AgentPlanningProgram::get_current_state()
    {
        return m_current_state_ptr;
    }


    AgentPlanningProgram::~AgentPlanningProgram()
    {

        for (auto &each_state: m_states)
        {

            delete each_state.second;
        }

        for (auto& each_transition: m_transitions)
        {
            delete each_transition;
        }

        delete m_current_state_ptr;

        std::cout << "APP deleted" << "\n";

    }


    
}



