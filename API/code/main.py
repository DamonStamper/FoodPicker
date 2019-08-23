from flask import Flask, request, jsonify
from flask_api import status
import os

app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"

# endpoint to check health of applicaion
@app.route("/healthz")
def healthz():
    return "OK", status.HTTP_200_OK

if __name__ == "__main__":
    if "DEBUG" in os.environ:
        app.run(host='0.0.0.0',debug=os.environ['DEBUG'],port=80)
    else:
        app.run(host='0.0.0.0',debug=False,port=80)