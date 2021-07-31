#include "rosplan_planning_system/PlannerInterface/PlannerInterface.h"
#include <fstream>
#include <sstream>
#include <string>
#include <ctime>
#include <string>
#include <streambuf>

#ifndef Kharsair_CUSTOM_METRICFF_planner_interface
#define Kharsair_CUSTOM_METRICFF_planner_interface

/**
 * This file contains an interface to the planner.
 */
namespace kharsair {

	class CustomMETRICFFPlannerInterface: public KCL_rosplan::PlannerInterface
	{
	private:

		bool use_ffha;

		/* runs external commands */
		std::string runCommand(std::string cmd);

	protected:

		bool runPlanner();

	public:

		CustomMETRICFFPlannerInterface(ros::NodeHandle& nh);
		virtual ~CustomMETRICFFPlannerInterface();
	};

} // close namespace

#endif