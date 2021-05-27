import json

def send_message(msg):
    return {
        'kind': 'send_message',
        'args': {
            'message': msg,
            'message_type': 'success'
        }
    }