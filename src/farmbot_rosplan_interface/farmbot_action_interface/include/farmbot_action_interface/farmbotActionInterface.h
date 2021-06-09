#include <ros/ros.h>
#include <vector>
#include <random>
#include "rosplan_action_interface/RPActionInterface.h"


#ifndef Kharsair_farmbotaction_H
#define Kharsair_farmbotaction_H


namespace kharsair {


	class FarmbotInterface: public KCL_rosplan::RPActionInterface
	{

	private:

		std::string pddl_action_name;
		std::string action_service_root;

		ros::ServiceClient action_interface_client;

	public:

		/* constructor */
		FarmbotInterface(ros::NodeHandle &nh);

		/* listen to and process action_dispatch topic */
		bool concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg);
	};
}
#endif