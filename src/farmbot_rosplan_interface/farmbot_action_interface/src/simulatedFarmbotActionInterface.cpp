#include "farmbot_action_interface/simulatedFarmbotActionInterface.h"

namespace kharsair {

	/* constructor */
	SimulatedFarmbotInterface::SimulatedFarmbotInterface(ros::NodeHandle &nh) {
		action_duration = -1.0;        // use duration calculated on plan by default
		action_duration_stddev = 0.0;  // wait exactly action duration by default
		action_probability = 1.0;
		nh.getParam("action_duration", action_duration);
		nh.getParam("action_duration_stddev", action_duration_stddev);
		nh.getParam("action_probability", action_probability);

        std::cout << "Launching simulated farmbot action" << std::endl;
		std::cout << "action probability is: " << action_probability << std::endl;
	}

	/* action dispatch callback */
	bool SimulatedFarmbotInterface::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {

		// wait for some time, plan-calculated by default
        double duration = msg->duration;
        if(action_duration >= 0) {
            // use time provided for the simulated action
            duration = action_duration;
        }

        if(action_duration_stddev > 0) {
           
            std::default_random_engine generator(ros::WallTime::now().toSec());
            std::normal_distribution<double> distribution(duration, action_duration_stddev);
            duration = std::max(distribution(generator), 0.0);
        }

        ROS_INFO("KCL: (%s) Action completing with probability %g and duration %g", params.name.c_str(), action_probability, duration);
        if(duration > 0) {
            ros::Rate wait = 1.0 / duration;
            wait.sleep();
        }

        std::cout << msg->name << std::endl;
        for (const auto& each: msg->parameters)
        {
            std::cout << each.key << " : " << each.value << std::endl;
        }

		// complete the action
		return true;
	}
} // close namespace

	/*-------------*/
	/* Main method */
	/*-------------*/

int main(int argc, char **argv) {

    ros::init(argc, argv, "simulated_farmbot_action", ros::init_options::AnonymousName);
    ros::NodeHandle nh("~");

    // create PDDL action subscriber
    kharsair::SimulatedFarmbotInterface rpsa(nh);

    rpsa.runActionInterface();

    return 0;
}
