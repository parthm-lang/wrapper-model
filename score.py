''' List all output parameters as comma-separated values in the "Output:" docString. Do not specify "None" if there is no output parameter.'''
''' List all Python packages that are not built-in packages in the "DependentPackages:" docString. Separate the package names with commas on a single line. '''
''' DependentPackages: requests '''

import requests
import json


def score_model(input_data):
    'Output:access_token,score_response_json'

    TOKEN_URL = "https://sasviya.demo.sas.com/SASLogon/oauth/token"

    token_payload = {
        "grant_type": "client_credentials",
        "client_id": "ap.client",
        "client_secret": "ap.secret"
    }

    token_headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        "Accept": "application/json"
    }

    token_response = requests.post(
        TOKEN_URL,
        data=token_payload,
        headers=token_headers
    )

    token_json = token_response.json()

    access_token = token_json.get("access_token")

    score_payload = {
        "inputs": [
            {"name": "LOAN", "value": 22000},
            {"name": "MORTDUE", "value": 85000},
            {"name": "VALUE", "value": 140000},
            {"name": "YOJ", "value": 7},
            {"name": "DEROG", "value": 0},
            {"name": "DELINQ", "value": 1},
            {"name": "CLAGE", "value": 165},
            {"name": "NINQ", "value": 2},
            {"name": "CLNO", "value": 23},
            {"name": "DEBTINC", "value": 34.1},
            {"name": "REASON_HomeImp", "value": 0},
            {"name": "JOB_Office", "value": 0},
            {"name": "JOB_Other", "value": 1},
            {"name": "JOB_ProfExe", "value": 0},
            {"name": "JOB_Sales", "value": 0},
            {"name": "JOB_Self", "value": 0}
        ]
    }

    baseURL = "https://sasviya.demo.sas.com"

    score_headers = {
        "Content-Type": "application/vnd.sas.microanalytic.module.step.input+json",
        "Authorization": "Bearer " + access_token
    }

    score_url = f"{baseURL}/microanalyticScore/modules/xgboost/steps/score"

    score_response = requests.post(
        score_url,
        json=score_payload,
        headers=score_headers
    )

    score_response_json = json.dumps(score_response.json())

    return str(access_token),str(score_response_json)
