#!/usr/bin/env python
from __future__ import print_function

import enum
import rospy
import std_msgs
import rosplan_knowledge_msgs
import rosplan_dispatch_msgs
import requests
import json
import paho.mqtt.publish as publish
import paho.mqtt.client as mqtt
from utils.celeryScriptFormatter import *
# from utils.FarmbotWrapper import Farmbot




def _get_credentials(credential_json_file):
    f = open(credential_json_file)
    data = json.load(f)
    f.close()

    return data["email"], data["psw"]

def get_token(credential_json_file, display=False):
    email, psw = _get_credentials(credential_json_file)

    response = requests.request(
        method='POST',
        url='https://my.farm.bot/api/tokens',
        headers={'content-type': 'application/json'},
        json={'user': {'email': email, 'password': psw}})

    token = response.json()
    
    if display:
        device_id = token['token']['unencoded']['bot']
        mqtt_broker = token['token']['unencoded']['mqtt']
        api_token = token['token']['encoded']

        print('[console info]: email', email)
        print('[console info]: psw', psw)
        print('[console info]: device id: ', device_id)
        print('[console info]: mqtt server: ', mqtt_broker)
        print('[console info]: api_token: ', api_token)

    return json.dumps(token)

class Farmbot_Action_Service:

    def move():
        pass

    

class Handler:

    def on_connect(self, bot, mqtt_client):
        # request_id1 = bot.move_absolute(x=10, y=20, z=30)

        # print("MOVE_ABS REQUEST ID: " + request_id1)

        req_id = bot.send_message("Hello, world!")

        rospy.loginfo("[on_connect]SEND_MESSAGE REQUEST ID: " + req_id)

        req_id = bot.toggle_light_on(True)

        rospy.loginfo("[on_connect]SEND_MESSAGE REQUEST ID: " + req_id)
        
        req_id = bot.take_photo()

        rospy.loginfo("[on_connect]SEND_MESSAGE REQUEST ID: " + req_id)
        pass

    def on_change(self, bot, state):
        rospy.loginfo("[on_change]NEW BOT STATE TREE AVAILABLE:")

        # if not self.written:
        #     with open('state.json', 'w') as outFile:
        #         json.dump(state, outFile)
        #     self.written = not self.written
        
        # #print(state)

        # print("Current position: (%.2f, %.2f, %.2f)" % bot.position())

        # pos = state["location_data"]["position"]
        # xyz = (pos["x"], pos["y"], pos["z"])
        # print("Same information as before: " + str(xyz))
        pass

    def on_log(self, bot, log):
        rospy.loginfo("[on_log]New message from FarmBot: " + log['message'])
        pass

    def on_response(self, bot, response):
        rospy.loginfo("[on_response]ID of successful request: " + response.id)
        pass

    def on_error(self, bot, response):
        rospy.logwarn("[on_error]ID of failed request: " + response.id)

        rospy.logwarn("[on_error]Reason(s) for failure: " + str(response.errors))
        pass



def farmbot_setup():

    rospy.loginfo("[console info]: getting credential")

    token = get_token(rospy.get_param('~credential_file'), False)

    bot = Farmbot(token)

    my_handler = Handler()

    bot.connect(my_handler)

    return bot




def main():
    rospy.init_node('farmbot_connector')

    rospy.loginfo("[console info]: farmbot_connector node started ")

    bot = farmbot_setup()



if __name__ == '__main__':
    main()
