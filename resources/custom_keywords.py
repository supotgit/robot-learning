import random
import re

def generate_test_username(perfix):
    number = random.randint(1000,9999)
    username = str(prefix) + "_" + str(number)
    return username

def validate_email_format(email):
    pattern = r'^[\w.-]+@[\w.-]+\.\w+$'
    result = re.match(pattern, str(email))
    if result:
        return True
    else:
        return False

def calculate_response_time_status(response_time):
    time = float(str(response_time))
    if time < 1.0:
        return "FASE"
    elif time < 3.0:
        return "OK"
    else:
        return "SLOW"
