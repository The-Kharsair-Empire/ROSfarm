#!/usr/bin/env python

from ros_tcp_endpoint import TcpServer, RosPublisher, RosSubscriber, RosService, UnityService
from farmbot_msgs.msg import FarmbotPosition, FarmbotFeedback, PDDLAction
import rospy
from rospy.timer import sleep

# actual_action_command_topic = rospy.get_param("actual_action_command_topic", "/farmbot_connector/action")
# actual_action_feedback_topic = rospy.get_param("actual_action_feedback_topic", "/farmbot_connector/feedback")

# test_pub = rospy.Publisher(actual_action_feedback_topic, FarmbotFeedback, queue_size=10)



# def test_callback_for_action_interface_command(msg):
#     rospy.loginfo("getting pddl command from the cpp action interface: action name: {}".format(msg.action_name))

#     counter = 0
#     for each in msg.parameters:
#         rospy.loginfo("parameter {}: {}".format(counter, each))
#         counter += 1


#     rate = rospy.Rate(1)
#     counter = 0
#     while counter < 10: #wait 10 s
#         rate.sleep()
#         counter += 1

#     fb = FarmbotFeedback()
#     fb.action_name = msg.action_name
#     fb.success = True


#     test_pub.publish(fb)
#     rospy.loginfo("sending the feedback back")
    

def start_endpoint():
    

    ros_node_name = rospy.get_param('/TCP_NODE_NAME', "TCPServer")
    rospy.init_node(ros_node_name, anonymous=False)

    rospy.loginfo('starting unity tcp endpoint: {}'.format(rospy.get_name()))

    actual_action_command_topic = rospy.get_param("actual_action_command_topic", "/farmbot_connector/action")
    actual_action_feedback_topic = rospy.get_param("actual_action_feedback_topic", "/farmbot_connector/feedback")

    rospy.loginfo("the action command topic is: {}".format(actual_action_command_topic))
    rospy.loginfo("the action feedback topic is: {}".format(actual_action_feedback_topic))
    
    
    # rospy.Subscriber(actual_action_command_topic, PDDLAction, test_callback_for_action_interface_command)

    # rospy.spin()

    tcp_server = TcpServer(rospy.get_name())

    tcp_server.start({
        actual_action_feedback_topic : RosPublisher(actual_action_feedback_topic, FarmbotFeedback, queue_size=10),
        actual_action_command_topic : RosSubscriber(actual_action_command_topic, PDDLAction, tcp_server)
    })

    rospy.loginfo('the endpoint is ready')

    rospy.spin()



if __name__ == '__main__':
    start_endpoint()
    