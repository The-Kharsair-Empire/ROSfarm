#include "rosplan_planning_system/PlannerInterface/PlannerInterface.h"
#include <fstream>
#include <sstream>
#include <string>
#include <ctime>
#include <string>
#include <streambuf>

#ifndef Kharsair_CUSTOM_BFWS_planner_interface
#define Kharsair_CUSTOM_BFWS_planner_interface

/**
 * This file contains an interface to the planner.
 */
namespace kharsair {

	class CustomBFWSPlannerInterface: public KCL_rosplan::PlannerInterface
	{
	private:

		bool use_ffha;
		std::string actualPlanFile;

		/* runs external commands */
		std::string runCommand(std::string cmd);

	protected:

		bool runPlanner();

	public:

		CustomBFWSPlannerInterface(ros::NodeHandle& nh);
		virtual ~CustomBFWSPlannerInterface();
	};

} // close namespace

#endif