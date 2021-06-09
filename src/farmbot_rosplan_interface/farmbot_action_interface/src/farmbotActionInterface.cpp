#include "farmbot_action_interface/farmbotActionInterface.h"
#include "farmbot_msgs/ActionInterfaceService.h"

namespace kharsair {



	/* constructor */
	FarmbotInterface::FarmbotInterface(ros::NodeHandle &nh) {

        nh.getParam("action_service_name", action_service_root);
        nh.getParam("pddl_action_name", pddl_action_name);
        ROS_INFO("Action service root name is: (%s)", action_service_root.c_str());
        ROS_INFO("For pddl action name: (%s)", pddl_action_name.c_str());

        std::stringstream service_name;

        service_name.str("");
        service_name << action_service_root << "/" << pddl_action_name;

        ROS_INFO("Action service name (%s)", service_name.str().c_str());

        action_interface_client = nh.serviceClient<farmbot_msgs::ActionInterfaceService>(service_name.str());

        if (!action_interface_client.waitForExistence(ros::Duration(10.0))) 
        {
            ROS_ERROR("service (%s) did not show up", service_name.str());
            return;
        }
        else
        {
            ROS_INFO("Getting the service: (%s)", service_name.str());
        }
        
    }

	/* action dispatch callback */
	bool FarmbotInterface::concreteCallback(const rosplan_dispatch_msgs::ActionDispatch::ConstPtr& msg) {

        // msg->duration is defined in the PDDL domain file
		// wait for some time, plan-calculated by default
        // double duration = msg->duration;
        // if(action_duration >= 0) {
        //     // use time provided for the simulated action
        //     duration = action_duration;
        // }

        // if(action_duration_stddev > 0) {
           
        //     std::default_random_engine generator(ros::WallTime::now().toSec());
        //     std::normal_distribution<double> distribution(duration, action_duration_stddev);
        //     duration = std::max(distribution(generator), 0.0);
        // }

        // ROS_INFO("KCL: (%s) Action completing with probability %g and duration %g", params.name.c_str(), action_probability, duration);
        // if(duration > 0) {
        //     ros::Rate wait = 1.0 / duration;
        //     wait.sleep();
        // }

		// complete the action
		return (rand() % 100) <= (100 * 1);
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
