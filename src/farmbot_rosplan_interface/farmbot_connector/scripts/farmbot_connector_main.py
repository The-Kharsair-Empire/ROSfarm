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
from utils.celeryScriptFormatter import *


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

    return token

class FarmbotTopic(enum.Enum):
    Logs = 'logs'
    FromClient = 'from_clients'
    Illegal = 'gg'


def main():
    rospy.init_node('farmbot_connector')

    print("[console info]: getting credential")

    token = get_token(rospy.get_param('~credential_file'), False)

    device_id = token['token']['unencoded']['bot']
    mqtt_broker = token['token']['unencoded']['mqtt']
    api_token = token['token']['encoded']

    print("[console info]: farmbot_connector node started ")

    message = send_message('wtf')

    publish.single(
        'bot/{}/{}'.format(device_id, FarmbotTopic.Illegal.value),
        payload=json.dumps(message),
        hostname=mqtt_broker,
        auth={
            'username': device_id,
            'password': api_token
            }
        )

    print("[console info]: greeting to farmbot sended")
    
    
    rospy.spin()

if __name__ == '__main__':
    main()