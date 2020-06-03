from flask import Flask,jsonify,request
import joblib
import pandas as pd
from flask.templating import render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template('form.html')

@app.route("/predict/",methods=['GET'])
def predict():
    result=request.args
    model_type=''
    data=[[float(result['sepallength']),float(result['sepalwidth']),float(result['petallength']),float(result['petalwidth'])]]
    if(result['model']=='gcv'):
        model_type='Grid Search CV'
        model=joblib.load('GCV_model.sav')
        prediction=model.predict(data)
    else:
        model_type='Suport Vector Classifier'
        model=joblib.load('SVCC_model.sav')
        prediction=model.predict(data)
    return jsonify({'model':model_type,'flower_species': prediction[0]}) 


if __name__ == '__main__':
    app.run()