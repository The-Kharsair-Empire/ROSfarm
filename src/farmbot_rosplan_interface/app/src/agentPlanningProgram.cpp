
#include "app/agentPlanningProgram.h"


namespace kharsair::APP
{

    class AgentPlanningProgram
    {

    private:
        ros::NodeHandle nh;


        ros::ServiceClient update_kb_array_service = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeUpdateServiceArray>("/rosplan_knowledge_base/update_array");
        ros::ServiceClient update_kb_service = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeUpdateService>("/rosplan_knowledge_base/update");

        ros::ServiceClient problem_generation_service = nh.serviceClient<std_srvs::Empty>("/rosplan_problem_interface/problem_generation_server");

        ros::ServiceClient planning_service = nh.serviceClient<std_srvs::Empty>("/rosplan_planner_interface/planning_server");

        ros::ServiceClient parse_plan_service = nh.serviceClient<std_srvs::Empty>("/rosplan_parsing_interface/parse_plan");

        ros::ServiceClient dispatch_plan_service = nh.serviceClient<std_srvs::Empty>("/rosplan_plan_dispatcher/dispatch_plan");

        enum class PROGRAM_STATE
        {
            PS_INIT,

            PS_NO_PLANT,
            PS_PLANTS_EXISTED,

            PS_TIME_TO_CHECK_MOISTURE,
            PS_NEED_TO_WATER

        } currentState, NextState;

   

        std::vector<rosplan_knowledge_msgs::KnowledgeItem> clearUpGoalsQueue;

        std::string pos[4] = {"a1", "a3", "a5", "a6"};
        std::string plants[4] = {"carrot", "basil", "carrot", "parsley"};
        int size = 4;


    public:
        AgentPlanningProgram(ros::NodeHandle &nh)
        {
            currentState = PROGRAM_STATE::PS_INIT;
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

    
        }

        bool runOnce()
        {

            std_srvs::Empty empty;
        
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

            if (dispatch_plan_service.call(empty))
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

        void run()
        {
            // ros::spin();
            // while (1)
            // {
                
            // }
            return;
        }

        





    };
}



int main(int argc, char **argv)
{
    std::cout << "gg!" << std::endl;
    ros::init(argc, argv, "agent_planning_program", ros::init_options::AnonymousName);
    ros::NodeHandle nh("~");
    kharsair::APP::AgentPlanningProgram app(nh);
    app.full_sequence_run();
    // app.transitioning();
    
    return 0;
}