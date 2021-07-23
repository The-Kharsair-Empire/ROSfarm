#include <ros/ros.h>
#include <iostream>
#include <algorithm>
#include "rosplan_knowledge_msgs/KnowledgeItem.h"
#include "rosplan_knowledge_msgs/KnowledgeUpdateService.h"
#include "rosplan_knowledge_msgs/KnowledgeUpdateServiceArray.h"
#include "rosplan_knowledge_msgs/KnowledgeQueryService.h"
#include "rosplan_dispatch_msgs/DispatchService.h"
#include "std_srvs/Empty.h"
#include "app/AgentPlanningProgram.h"



namespace kharsair::APP
{

    

    class APPManager
    {

    private:
        ros::NodeHandle nh;

        std::unique_ptr<AgentPlanningProgram> agent_planning_program;


        ros::ServiceClient update_kb_array_service,  update_kb_service, problem_generation_service, planning_service, parse_plan_service, dispatch_plan_service, query_kb_service; 

        std::vector<rosplan_knowledge_msgs::KnowledgeItem> clearUpGoalsQueue;

        std::string pos[4] = {"a1", "a3", "a5", "a6"};
        std::string plants[4] = {"carrot", "basil", "carrot", "parsley"};
        int size = 4;


    public:
        APPManager(ros::NodeHandle &nh)
        {
            update_kb_array_service = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeUpdateServiceArray>("/rosplan_knowledge_base/update_array");
            update_kb_service = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeUpdateService>("/rosplan_knowledge_base/update");

            problem_generation_service = nh.serviceClient<std_srvs::Empty>("/rosplan_problem_interface/problem_generation_server");

            planning_service = nh.serviceClient<std_srvs::Empty>("/rosplan_planner_interface/planning_server");

            parse_plan_service = nh.serviceClient<std_srvs::Empty>("/rosplan_parsing_interface/parse_plan");

            dispatch_plan_service = nh.serviceClient<rosplan_dispatch_msgs::DispatchService>("/rosplan_plan_dispatcher/dispatch_plan");

            query_kb_service = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeQueryService>("/rosplan_knowledge_base/query_state");

            std::string fileName;
            nh.getParam("APP_Definition_File", fileName);

            bool construct_success;
            agent_planning_program = std::make_unique<AgentPlanningProgram>(fileName, construct_success);
    


            if (!construct_success)
            {
                ROS_ERROR("Did not construct APP");
                return;

            } else std::cout << *agent_planning_program << std::endl;

            

            // currentState = PROGRAM_STATE::PS_INIT;
            

            this->nh = nh;
            if (!update_kb_array_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the update kb array service did not start in 10 seconds");
                return;
            }

            if (!update_kb_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the update kb service did not start in 10 seconds");
                return;
            }

            if (!problem_generation_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the problem generation service did not start in 10 seconds");
                return;
            }

            if (!planning_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the planning service did not start in 10 seconds");
                return;
            }

            if (!parse_plan_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the parse plan service did not start in 10 seconds");
                return;
            }

            if (!dispatch_plan_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the dispatch plan service did not start in 10 seconds");
                return;
            }
            if(!query_kb_service.waitForExistence(ros::Duration(10.0)))
            {
                ROS_ERROR("the query kb service did not start in 10 seconds");
                return;
            }

    
        }

        bool runOnce()
        {

            std_srvs::Empty empty;
            rosplan_dispatch_msgs::DispatchService dispatchService;
        
            ROS_INFO("Generating a Problem");
            if (problem_generation_service.call(empty))
            {
                ROS_INFO("==== Finished generating problem");
            } 
            else 
            {
                ROS_ERROR("==== Failed generating problem");
                return false;
            }

            ROS_INFO("Planning");
            if (planning_service.call(empty))
            {
                ROS_INFO("==== Finished planning");
            }
            else 
            {
                ROS_ERROR("==== Failed planing ");
                return false;
            }

            ROS_INFO("Executing the Plan");
            if (parse_plan_service.call(empty))
            {
                ROS_INFO("==== Finished parsing plan");
            }
            else 
            {
                ROS_ERROR("==== Failed parsing plan");
                return false;
            }

            if (dispatch_plan_service.call(dispatchService))
            {
                ROS_INFO("==== Finished dispatching plan");
            }
            else 
            {
                ROS_ERROR("==== Failed dispatching plan");
                return false;
            }

            return true;
        }

        bool clearUpGoals()
        {   
            rosplan_knowledge_msgs::KnowledgeUpdateServiceArray srv;

            for (auto& old_goal_item: clearUpGoalsQueue)
            {
                srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::REMOVE_GOAL);
                srv.request.knowledge.push_back(old_goal_item);

            }

            if (update_kb_array_service.call(srv))
            {
                ROS_INFO("update the KB to Remove Old Goals: (%s)", srv.response.success ? "success" : "failed");
            }
            else
            {
                ROS_ERROR("Failed to call service to remove old goals");
                return false;
            }

            clearUpGoalsQueue.clear();
            return true;

        }

        bool transition(std::string& priority_transition = (std::string&) "")
        {
            std::vector<AgentPlanningProgram::APP_Transition*> valid_transitions;
            // AgentPlanningProgram::APP_Transition* selected_transition;
            for (auto& each_transition: agent_planning_program->get_current_state()->available_transition)
            {   

                rosplan_knowledge_msgs::KnowledgeQueryService query;

                for (auto& each_guard: each_transition->guards)
                {
                    //std::cout << "guard" << " ";
                    rosplan_knowledge_msgs::KnowledgeItem guard_item;
                    guard_item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                    guard_item.attribute_name = each_guard.predicate_name;

                    for (auto& each_parameters: each_guard.parameters)
                    {
                        diagnostic_msgs::KeyValue kv;
                        kv.key = each_parameters.key;
                        kv.value = each_parameters.value;
                        guard_item.values.push_back(kv);
                    }
                    query.request.knowledge.push_back(guard_item);

                }

                for (auto& each_m_goal: each_transition->maintenance_goals)
                {
                    //std::cout << "maintenance" << " ";
                    rosplan_knowledge_msgs::KnowledgeItem maintenance_goal_item;
                    maintenance_goal_item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                    maintenance_goal_item.attribute_name = each_m_goal.predicate_name;

                    for (auto& each_parameters: each_m_goal.parameters)
                    {
                        diagnostic_msgs::KeyValue kv;
                        kv.key = each_parameters.key;
                        kv.value = each_parameters.value;
                        maintenance_goal_item.values.push_back(kv);
                    }
                    query.request.knowledge.push_back(maintenance_goal_item);

                }

                if (query_kb_service.call(query))
                {

                    bool satisfy_flag = true;

                    for (std::uint8_t result: query.response.results)
                    {
                        if (result == 0)
                        {
                            satisfy_flag = false;
                            break;
                        }
                    }
                    if (satisfy_flag)
                    {

                        valid_transitions.push_back(each_transition);
                        // selected_transition = each_transition;
                        ROS_INFO("Transition precondition or invariant satisfied for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), each_transition->transition_name.c_str());
                        // goto stop_checking_transition;
                    }
                    else
                    {
                        ROS_INFO("Transition precondition or invariant NOT satisfied for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), each_transition->transition_name.c_str());
                    }
                    

                }
                else
                {
                    ROS_ERROR("Failed to call service to check guard before transition for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), each_transition->transition_name.c_str());
                    return false;
                }
                
            }

            if (valid_transitions.size() == 0)
            {
                ROS_ERROR("No Valid Transition at all from state (%s)", agent_planning_program->get_current_state()->state_name.c_str());
                return false;
            }


            std::sort(valid_transitions.begin(), valid_transitions.end(), [](AgentPlanningProgram::APP_Transition* t1, AgentPlanningProgram::APP_Transition* t2){
                return t1->execution_time < t2->execution_time;
            });


            AgentPlanningProgram::APP_Transition* selected_transition = valid_transitions[0];
            selected_transition->execution_time++;


            rosplan_knowledge_msgs::KnowledgeUpdateServiceArray srv;

            for (auto& each_goal: selected_transition->achievement_goals)
            {

                srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::ADD_GOAL);
                rosplan_knowledge_msgs::KnowledgeItem item;
                item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                item.attribute_name = each_goal.predicate_name;
                for (auto& each_parameters: each_goal.parameters)
                {
                    diagnostic_msgs::KeyValue kv;
                    kv.key = each_parameters.key;
                    kv.value = each_parameters.value;
                    item.values.push_back(kv);
                }
     
                srv.request.knowledge.push_back(item);

                clearUpGoalsQueue.push_back(item);
            }

            if (update_kb_array_service.call(srv))
            {
                ROS_INFO("update the KB to Add plant-at goals: (%s)", srv.response.success ? "success" : "failed");
            }
            else
            {
                ROS_ERROR("Failed to call service to update goals in knowledge base");
                return false;
            }

            if (!runOnce()) 
            {
                ROS_ERROR("Run once failed");
                return false;
            }
            if (!clearUpGoals())
            {
                ROS_ERROR("clear up goals failed");
                return false;

            }

            rosplan_knowledge_msgs::KnowledgeQueryService query;

            for (auto& each_a_goal: selected_transition->achievement_goals)
            {
                rosplan_knowledge_msgs::KnowledgeItem achievement_goal_item;
                achievement_goal_item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                achievement_goal_item.attribute_name = each_a_goal.predicate_name;

                for (auto& each_parameters: each_a_goal.parameters)
                {
                    diagnostic_msgs::KeyValue kv;
                    kv.key = each_parameters.key;
                    kv.value = each_parameters.value;
                    achievement_goal_item.values.push_back(kv);
                }
                query.request.knowledge.push_back(achievement_goal_item);

            }

            for (auto& each_m_goal: selected_transition->maintenance_goals)
            {
                rosplan_knowledge_msgs::KnowledgeItem maintenance_goal_item;
                maintenance_goal_item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                maintenance_goal_item.attribute_name = each_m_goal.predicate_name;

                for (auto& each_parameters: each_m_goal.parameters)
                {
                    diagnostic_msgs::KeyValue kv;
                    kv.key = each_parameters.key;
                    kv.value = each_parameters.value;
                    maintenance_goal_item.values.push_back(kv);
                }
                query.request.knowledge.push_back(maintenance_goal_item);

            }

            if (query_kb_service.call(query))
            {

                for (std::uint8_t result: query.response.results)
                {
                    if (result == 0)
                    {
                        ROS_ERROR("Transition failed for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), selected_transition->transition_name.c_str());
                        return false;
                    }
                }

                ROS_INFO("Transition succeeded for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), selected_transition->transition_name.c_str());

                agent_planning_program->set_current_state(selected_transition->end_state->state_name);
                return true;
                
            }
            else
            {
                ROS_ERROR("Failed to call service to check achievement goal after transition for state (%s) on transition (%s)", agent_planning_program->get_current_state()->state_name.c_str(), selected_transition->transition_name.c_str());
                return false;
            }

         
        
        }

/*
        void full_sequence_run()
        {
            rosplan_knowledge_msgs::KnowledgeUpdateServiceArray srv;

            for (int i=0; i < size; i++)
            {
                srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::ADD_GOAL);
                rosplan_knowledge_msgs::KnowledgeItem item;
                item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                item.attribute_name = "plant-at";
                diagnostic_msgs::KeyValue kv1, kv2; 
                kv1.key = 'x'; kv1.value = pos[i];
                kv2.key = 'p'; kv2.value = plants[i];
                item.values.push_back(kv1); item.values.push_back(kv2);
                srv.request.knowledge.push_back(item);

                clearUpGoalsQueue.push_back(item);
            }

            if (update_kb_array_service.call(srv))
            {
                ROS_INFO("update the KB to Add plant-at goals: (%s)", srv.response.success ? "success" : "failed");
            }
            else
            {
                ROS_ERROR("Failed to call service");
                return;
            }

            runOnce();

            clearUpGoals();

 
            srv.request.update_type.clear();
            srv.request.knowledge.clear();

            for (int i=0; i < size; i++)
            {
                
                srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::ADD_GOAL);
                rosplan_knowledge_msgs::KnowledgeItem item;
                item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                item.attribute_name = "checked-moisture";
                diagnostic_msgs::KeyValue kv1, kv2; 
                kv1.key = 'x'; kv1.value = pos[i];
                kv2.key = 'p'; kv2.value = plants[i];
                item.values.push_back(kv1); item.values.push_back(kv2);
                srv.request.knowledge.push_back(item);

                clearUpGoalsQueue.push_back(item);
            }

            if (update_kb_array_service.call(srv))
            {
                ROS_INFO("update the KB to Add checked-moisture goals: (%s)", srv.response.success ? "success" : "failed");
            }
            else
            {
                ROS_ERROR("Failed to call service");
                return;
            }

            runOnce();

            clearUpGoals();

            srv.request.update_type.clear();
            srv.request.knowledge.clear();

            for (int i=0; i < size; i++)
            {
                srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::ADD_GOAL);
                rosplan_knowledge_msgs::KnowledgeItem item;
                item.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
                item.attribute_name = "watered";
                diagnostic_msgs::KeyValue kv1, kv2; 
                kv1.key = 'x'; kv1.value = pos[i];
                kv2.key = 'p'; kv2.value = plants[i];
                item.values.push_back(kv1); item.values.push_back(kv2);
                srv.request.knowledge.push_back(item);

                clearUpGoalsQueue.push_back(item);
            }

            if (update_kb_array_service.call(srv))
            {
                ROS_INFO("update the KB to Add watered goals: (%s)", srv.response.success ? "success" : "failed");
            }
            else
            {
                ROS_ERROR("Failed to call service");
                return;
            }

            runOnce();



        }
*/
        void run()
        {
            ros::Rate loop_rate(1);

            while (1)
            {
                if (!transition()) return;

                loop_rate.sleep();

            }
       
        }

    

    };
}



int main(int argc, char **argv)
{
    ros::init(argc, argv, "agent_planning_program", ros::init_options::AnonymousName);
    ros::NodeHandle nh("~");
    kharsair::APP::APPManager app(nh);
    app.run();
    // app.transitioning();
    
    return 0;
}