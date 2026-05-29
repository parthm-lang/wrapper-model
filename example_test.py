import os
import os.path
import sys

sys.path.append('/models/resources/viya/386bd18e-ca5a-4e29-824f-b0d6fc630c53/')

import score

import settings_386bd18e_ca5a_4e29_824f_b0d6fc630c53

settings_386bd18e_ca5a_4e29_824f_b0d6fc630c53.pickle_path = '/models/resources/viya/386bd18e-ca5a-4e29-824f-b0d6fc630c53/'

def score_record(input_data):
    "Output: access_token,score_response_json"
    return score.score_model(input_data)

print(score_record(""))
