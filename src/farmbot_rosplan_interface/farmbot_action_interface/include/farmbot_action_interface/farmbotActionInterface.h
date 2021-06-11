#include <ros/ros.h>
#include <vector>
#include <random>
#include "rosplan_action_interface/RPActionInterface.h"
#include "farmbot_msgs/PDDLAction.h"
#include "farmbot_msgs/FarmbotFeedback.h"


#ifndef Kharsair_farmbotaction_H
#define Kharsair_farmbotaction_H


namespace kharsair {


	class FarmbotInterface: public KCL_rosplan::RPActionInterface
	{

	private:

		std::string pddl_action_name;
		std::string actual_action_command_topic;
		std::string actual_action_feedback_topic;

		
		
		ros::Publisher pddl_action_command_publisher;
		ros::Subscriber action_feedback_subscriber;

		bool farmbot_feedback_received = false;
		bool farmbot_feedback_content;

		void farmbotFeedbackCallback(const farmbot_msgs::FarmbotFeedback::ConstPtr& msg);

	public:


		/* constructor */
		FarmbotInterface(ros::NodeHandle &nh);

		/* listen to and process action_dispatch topic */
		bool concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg);
	};
}
#endif