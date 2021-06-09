#!/usr/bin/env python

import rospy
# import std_msgs
# import rosplan_knowledge_msgs
# import rosplan_dispatch_msgs
# import farmbot_msgs
from rosplan_knowledge_msgs.msg import KnowledgeItem
from rosplan_knowledge_msgs.srv import KnowledgeUpdateService, \
    KnowledgeUpdateServiceRequest, KnowledgeUpdateServiceResponse #, \
    # KnowledgeUpdateServiceArray, KnowledgeUpdateServiceArrayRequest, \
    #     KnowledgeUpdateServiceArrayResponse

from diagnostic_msgs.msg import KeyValue
from rospy.client import INFO
 
# import farmbot_rosplan_interface.farmbot_msgs

def main():
    rospy.init_node('test_update_kb')
    rospy.loginfo('python test_update_kb node started') 

    req1 = KnowledgeUpdateServiceRequest()
    req1.update_type = KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE
    req1.knowledge = KnowledgeItem()
    req1.knowledge.knowledge_type = KnowledgeItem.FACT
    req1.knowledge.attribute_name = 'robot-functioning'

    req2 = KnowledgeUpdateServiceRequest()
    req2.update_type = KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE
    req2.knowledge = KnowledgeItem()
    req2.knowledge.knowledge_type = KnowledgeItem.FACT
    req2.knowledge.attribute_name = 'at-robot'
    req2.knowledge.values.append(KeyValue('x', 'loc1_1'))
    # req = KnowledgeUpdateServiceArrayRequest()
    # ki1 = KnowledgeItem()
    # ki1.knowledge_type = KnowledgeItem.FACT
    # ki1.attribute_name = 'robot-functioning'

    # ki2 = KnowledgeItem()
    # ki2.knowledge_type = KnowledgeItem.FACT
    # ki2.attribute_name = 'at-robot'
    # ki2.values.append(KeyValue('x', 'loc1_1'))

    # uts = str(KnowledgeUpdateServiceArrayRequest.REMOVE_KNOWLEDGE)+' - '+str(KnowledgeUpdateServiceArrayRequest.REMOVE_KNOWLEDGE)
    # rospy.loginfo('Update type byte array is:' + uts)
    # req.update_type = bytes(KnowledgeUpdateServiceArrayRequest.REMOVE_KNOWLEDGE)
    # req.knowledge.extend([ki1, ki2])

    
    rospy.wait_for_service('/rosplan_knowledge_base/update', 10)
    # try:
    service = rospy.ServiceProxy('/rosplan_knowledge_base/update', KnowledgeUpdateService)
    res = service(req1)

    rospy.loginfo('update the KB knowledge ' + str(req1.knowledge.attribute_name) +' successfully? : (' + str(res.success) + ')')

    res = service(req2)

    rospy.loginfo('update the KB knowledge ' + str(req2.knowledge.attribute_name) +' successfully? : (' + str(res.success) + ')')
    # except:
    #     rospy.logerr('failed to call service')

    # rospy.spin()

if __name__ == '__main__':
    main()