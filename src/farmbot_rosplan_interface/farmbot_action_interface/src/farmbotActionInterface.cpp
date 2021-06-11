#include "farmbot_action_interface/farmbotActionInterface.h"

namespace kharsair {

    
    void FarmbotInterface::farmbotFeedbackCallback(const farmbot_msgs::FarmbotFeedback::ConstPtr& msg)
    {
        if (pddl_action_name.compare(msg->action_name) == 0) 
        {
            farmbot_feedback_content = msg->success;
            farmbot_feedback_received = true;
        }

        
    }

	/* constructor */
	FarmbotInterface::FarmbotInterface(ros::NodeHandle &nh) {

        nh.getParam("actual_action_command_topic", actual_action_command_topic);
        nh.getParam("actual_action_feedback_topic", actual_action_feedback_topic);
        nh.getParam("pddl_action_name", pddl_action_name);
        ROS_INFO("The actual command topic name is: (%s)", actual_action_command_topic.c_str());
        ROS_INFO("For pddl action name: (%s)", pddl_action_name.c_str());

        ROS_INFO("The actial command feedback topic name is : (%s)", actual_action_feedback_topic.c_str());

        pddl_action_command_publisher = nh.advertise<farmbot_msgs::PDDLAction>(actual_action_command_topic, 10);
        action_feedback_subscriber = nh.subscribe(actual_action_feedback_topic, 1000, &FarmbotInterface::farmbotFeedbackCallback, this);
        
        ros::Rate loop_rate(1);

        std::stringstream progressBar;
        progressBar.str("");
        ROS_INFO("Waiting for farmbot to subscribe to this action interface: [%s]", pddl_action_name.c_str());
        
        while (pddl_action_command_publisher.getNumSubscribers() < 1) {
            progressBar << "===|";
            loop_rate.sleep();
        }

        ROS_INFO("%s", progressBar.str().c_str());
        
        ROS_INFO("The action (%s) has started", pddl_action_name.c_str());


    }

	/* action dispatch callback */
	bool FarmbotInterface::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {
        

        farmbot_msgs::PDDLAction commandMsg;
        commandMsg.action_name = msg->name;
        ROS_INFO("Sending msg: action name: (%s)", commandMsg.action_name.c_str());

        for (const auto& each: msg->parameters)
        {
            commandMsg.parameters.push_back(each.value);
            ROS_INFO("Parameters: [%s]", each.value.c_str());
        }

        pddl_action_command_publisher.publish(commandMsg);

        ros::Rate loop_rate(5);


        std::stringstream progressBar;
        progressBar.str("");

        ROS_INFO("[%s] action is being dispatched to farmbot, waiting for feedback", pddl_action_name.c_str());

        while (!farmbot_feedback_received)
        {
            ros::spinOnce();
            loop_rate.sleep();
            progressBar << "===|";
        }

        ROS_INFO("%s", progressBar.str().c_str());

        farmbot_feedback_received = false;


        ROS_INFO("feedback received, the action success? (%s)", farmbot_feedback_content ? "true" : "false");

        return farmbot_feedback_content;

	}
} // close namespace

	/*-------------*/
	/* Main method */
	/*-------------*/

int main(int argc, char **argv) {

    ros::init(argc, argv, "farmbot_action_interface_client", ros::init_options::AnonymousName);
    ros::NodeHandle nh("~");

    // create PDDL action subscriber
    kharsair::FarmbotInterface rpsa(nh);

    rpsa.runActionInterface();

    return 0;
}
