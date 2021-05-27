rostopic echo /rosplan_problem_interface/problem_instance -n 1 -p

rostopic echo /rosplan_planner_interface/planner_output -p

rostopic echo /rosplan_parsing_interface/complete_plan -n 1

rostopic echo /rosplan_plan_dispatcher/action_feedback -n 1

rostopic echo /rosplan_plan_dispatcher/action_dispatch -n 1

rostopic echo /rosplan_plan_dispatcher/plan_graph -n 1 -p
