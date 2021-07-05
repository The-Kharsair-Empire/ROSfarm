# !bin/bash

update_type="update_type:"
knowledge="knowledge:"

declare -A arr

arr["a1"]="carrot"

arr+=( ["a3"]="basil" ["a5"]="carrot" ["a6"]="parsley")



function run() {
    echo "Generating a Problem"
    rosservice call /rosplan_problem_interface/problem_generation_server

    echo "Planning"
    rosservice call /rosplan_planner_interface/planning_server

    echo "Executing the Plan"
    # rosservice call /rosplan_parsing_interface/parse_plan_from_file "plan_path: '/mnt/c/Users/IS350F-Sport/Documents/UbuntuWSL/ROSfarm/src/pddl/common/plan.pddl'"
    rosservice call /rosplan_parsing_interface/parse_plan
    rosservice call /rosplan_plan_dispatcher/dispatch_plan
}

function update_kb () {
    rosservice call /rosplan_knowledge_base/update_array "
    $update_type
    $knowledge";
}

run

for i in ${!arr[@]};
do
    # echo $i ${arr[$i]}
    update_type="$update_type
    - 3"; #remove
    knowledge="$knowledge
    - knowledge_type: 1
      attribute_name: 'plant-at'
      values:
      - {key: 'x', value: $i}
      - {key: 'p', value: ${arr[$i]}} ";

    update_type="$update_type
    - 1";
    knowledge="$knowledge
    - knowledge_type: 1
      attribute_name: 'checked-moisture'
      values:
      - {key: 'x', value: $i}
      - {key: 'p', value: ${arr[$i]}}";

done

update_kb
update_type="update_type:"
knowledge="knowledge:"
run

for i in ${!arr[@]};
do

    update_type="$update_type
    - 3";
    knowledge="$knowledge
    - knowledge_type: 1
      attribute_name: 'checked-moisture'
      values:
      - {key: 'x', value: $i}
      - {key: 'p', value: ${arr[$i]}}";


    update_type="$update_type
    - 1";
    knowledge="$knowledge
    - knowledge_type: 1
      attribute_name: 'watered'
      values:
      - {key: 'x', value: $i}
      - {key: 'p', value: ${arr[$i]}}";



    # if [[ $i == "a1" ]] || [[ $i == "a5" ]];
    # then
    # update_type="$update_type
    # - 0";
    # knowledge="$knowledge
    # - knowledge_type: 1
    #   attribute_name: 'need-water'
    #   values:
    #   - {key: 'x', value: $i}
    #   - {key: 'p', value: ${arr[$i]}}";

    # else
    # update_type="$update_type
    # - 0";
    # knowledge="$knowledge
    # - knowledge_type: 1
    #   attribute_name: 'not-need-water'
    #   values:
    #   - {key: 'x', value: $i}
    #   - {key: 'p', value: ${arr[$i]}}";
    # fi;

done


update_kb
update_type="update_type:"
knowledge="knowledge:"

run