
#include "app/rapidjson/document.h"
#include <iostream>
#include <fstream>
#include <vector>

#ifndef Kharsair_APPParser_H
#define Kharsair_APPParser_H

namespace kharsair::APP 
{
    struct vStr2d
    {
        std::string key;
        std::string value;
    };

    struct Predicate
    {
        std::string predicate_name;
        std::vector<vStr2d> parameters;

        friend std::ostream& operator<<(std::ostream& os, Predicate& transition)
        {
            os << "\t\t\tpredicate name : " << transition.predicate_name << '\n';
            os << "\t\t\tparameters : { \n ";
            for (auto& each_parameter : transition.parameters)
                os << "\t\t\t\t" << each_parameter.key << ':' << each_parameter.value << '\n';
            os << "\t\t\t}" << '\n';

            return os;
        }

    };


    struct APP_Transition
    {
        std::string name;
        std::string startState;
        std::string endState;
        std::vector<Predicate> guards;
        std::vector<Predicate> maintenance_goals;
        std::vector<Predicate> achievement_goals;

        friend std::ostream& operator<<(std::ostream& os, APP_Transition& transition)
        {
            os << '\t' << "name : " << transition.name << '\n';
            os << '\t' << "startState : " << transition.startState << '\n';
            os << '\t' << "endState : " << transition.endState << '\n';

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
    };


    struct AgentPlanningProgram
    {
        std::vector<std::string> states;
        std::vector<APP_Transition> transitions;


        friend std::ostream& operator<<(std::ostream& os, AgentPlanningProgram& app)
        {
            os << "APP: " << '\n' << "States: " ;
            for (auto& each_state: app.states)
                os << '\t' << each_state;

            os << '\n' << "Transition: " << '\n';
            for (auto& each_transition: app.transitions)
                os << each_transition << "\n\n";
            os << '\n';
            return os;
        }
    };

    void help_populate_predicates(std::vector<Predicate> &predicate_list, rapidjson::Value &predicate_values)
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

    bool parse_from_file(std::string fileName, AgentPlanningProgram* app)
    {
        // std::ifstream file(R"(C:\Users\IS350F-Sport\Desktop\APP.json)");
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

        // AgentPlanningProgram app;

        for (rapidjson::SizeType i = 0; i < States.Size(); i ++)
        {
            assert(States[i].IsString());

            app->states.emplace_back(States[i].GetString());
        }

        for (rapidjson::SizeType j = 0; j < Transitions.Size(); j ++)
        {
            assert(Transitions[j].IsObject());
            APP_Transition temp;
            temp.name = Transitions[j]["name"].GetString();
            temp.startState = Transitions[j]["StartState"].GetString();
            temp.endState = Transitions[j]["EndState"].GetString();
            std::cout << temp.name << '|' << temp.startState << '|' << temp.endState;
            help_populate_predicates(temp.guards, Transitions[j]["Guards"]);
            help_populate_predicates(temp.maintenance_goals, Transitions[j]["MaintenanceGoals"]);
            help_populate_predicates(temp.achievement_goals, Transitions[j]["AchievementGoals"]);

            app->transitions.push_back(temp);

        }

        return true;


    }
}



#endif