#Import necessary packages
import io
import re
import time
import os
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from bs4 import BeautifulSoup
import numpy as np
import json
import requests
from urllib.request import urlopen
from selenium import webdriver
from selenium.webdriver import ActionChains
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from flask import Flask, render_template, request, redirect, session, jsonify
from flask_cors import CORS
from flask_restful import Api, Resource, reqparse
from waitress import serve
import firebase_admin
from firebase_admin import credentials
from google.auth import exceptions,jwt
from googleapiclient import discovery
from google.oauth2.service_account import Credentials

#Create Flask App and expose initialize using CORS
app = Flask(__name__)
CORS(app)
api = Api(app)

#Initialize RequestParser to receive api post request variables
parser = reqparse.RequestParser()
parser.add_argument("user_id")
parser.add_argument("fcm")

#Initialize Flask app with firebase_admin and set variable cred (used for push notification authorization)
cred = credentials.Certificate("C:/goutam/soham/service-account.json")
firebase_admin.initialize_app(cred)
print(cred)

#Returns access token to authorize Firebase push notification
def _get_access_token():
    SCOPES = []
    SCOPES.append("https://www.googleapis.com/auth/firebase.messaging")
    credentials = firebase-adminsdk.Credentials.from_service_account_file(
        'C:/goutam/soham/service-account.json', scopes=SCOPES)
    request = google.auth.transport.requests.Request()
    credentials.refresh(request)
    return credentials.token

#Receive FCM Token and User information from Flutter App to return associated club information
@app.route("/stuyactivities", methods=['GET', 'POST'])
def home():
    print("API Hit")
    time.sleep(2)
    if request.method == "POST":
        user = request.form.get("user_id")
        print(user)
        deviceToken = request.form.get("fcm")
        print(deviceToken)
    return("Python says hello")

if __name__ == "__main__":
    serve(app, host="192.168.1.170", port=5001)