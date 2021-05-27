rosservice call /rosplan_knowledge_base/domain/name
echo "============================================="
rosservice call /rosplan_knowledge_base/domain/types
echo "============================================="
rosservice call /rosplan_knowledge_base/domain/predicates
echo "============================================="
rosservice call /rosplan_knowledge_base/domain/operators
echo "============================================="
rosservice info /rosplan_knowledge_base/domain/operators
echo "============================================="
rossrv show rosplan_knowledge_msgs/GetDomainOperatorService
echo "============================================="
rossrv show rosplan_knowledge_msgs/GetDomainOperatorDetailsService