#include <ros/ros.h>
#include <vector>
#include <random>
#include "rosplan_action_interface/RPActionInterface.h"


#ifndef Kharsair_simulatedfarmbotaction_H
#define Kharsair_simulatedfarmbotaction_H


namespace kharsair {


	class SimulatedFarmbotInterface: public KCL_rosplan::RPActionInterface
	{

	private:

		double action_duration;
		double action_duration_stddev;
		double action_probability;

	public:

		/* constructor */
		SimulatedFarmbotInterface(ros::NodeHandle &nh);

		/* listen to and process action_dispatch topic */
		bool concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg);
	};
}
#endif