#!/usr/bin/env python

import rospy
import std_msgs
import rosplan_knowledge_msgs
import rosplan_dispatch_msgs
# import farmbot_rosplan_interface.farmbot_msgs

def main():
    rospy.init_node('test_update_kb')
    print("[console info]: test_update_kb node started ")
    rospy.spin()

if __name__ == '__main__':
    main()