#!bin/bash
# rosservice call /rosplan_knowledge_base/update "update_type: 0
# knowledge:
#   knowledge_type: 1
#   attribute_name: 'farmbot-at'
#   values:
#     {key: 'x', value: 'posA'}" 


update_type="update_type:"
knowledge="knowledge:"

# # Move initial pos to posA
# update_type="$update_type
# - 0";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'farmbot-at'
#   values:
#   - {key: 'x', value: 'posA'}"

# # Del original initial pos
# update_type="$update_type
# - 2";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'farmbot-at'
#   values:
#   - {key: 'x', value: 'posinit'}"



# update_type="$update_type
# - 0";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'docked'
#   values:
#   - {key: 'v', value: 'kenny'}"

# # Del original initial pos
# update_type="$update_type
# - 2";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'undocked'
#   values:
#   - {key: 'v', value: 'kenny'}"

# # Del localised
# update_type="$update_type
# - 2";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'localised'
#   values:
#   - {key: 'v', value: 'kenny'}"

################ this is how you update predicate with no argument
update_type="$update_type
- 2";
knowledge="$knowledge
- knowledge_type: 1
  attribute_name: 'robot-functioning'  
  "

# update_type="$update_type
# - 2";
# knowledge="$knowledge
# - knowledge_type: 1
#   attribute_name: 'at-robot'
#   values:
#   - {key: 'x', value: 'loc1_1'}"

rosservice call /rosplan_knowledge_base/update_array "
$update_type
$knowledge";