#include <ros/ros.h>
#include "rosplan_knowledge_msgs/KnowledgeItem.h"
#include "rosplan_knowledge_msgs/KnowledgeUpdateService.h"
#include "rosplan_knowledge_msgs/KnowledgeUpdateServiceArray.h"

int main(int argc, char **argv) {

    ros::init(argc, argv, "test_update_kb");

    ros::NodeHandle nh;

    ros::ServiceClient c = nh.serviceClient<rosplan_knowledge_msgs::KnowledgeUpdateServiceArray>("/rosplan_knowledge_base/update_array");

    rosplan_knowledge_msgs::KnowledgeUpdateServiceArray srv;

    rosplan_knowledge_msgs::KnowledgeItem ki1;
    ki1.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
    ki1.attribute_name = "robot-functioning";
    //ki.values.push_back()

    rosplan_knowledge_msgs::KnowledgeItem ki2;
    ki2.knowledge_type = rosplan_knowledge_msgs::KnowledgeItem::FACT;
    ki2.attribute_name = "at-robot";
    diagnostic_msgs::KeyValue kv;
    kv.key = "x";
    kv.value = "loc1_1";
    ki2.values.push_back(kv);

    srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::REMOVE_KNOWLEDGE);
    srv.request.update_type.push_back(rosplan_knowledge_msgs::KnowledgeUpdateServiceArrayRequest::REMOVE_KNOWLEDGE);
    srv.request.knowledge.push_back(ki1);
    srv.request.knowledge.push_back(ki2);

    if(c.call(srv))
    {
        ROS_INFO("update the KB: (%s)", srv.response.success ? "success" : "failed");
    }
    else
    {
        ROS_ERROR("Failed to call service");
        return 1;
    }

    return 0;
}