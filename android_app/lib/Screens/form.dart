import 'package:android_app/Screens/result.dart';
import 'package:android_app/shared/fielddecoration.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Details extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Details> {
  //variables
  bool modeltypeform = true, detailsform = false;
  String model;
  double sepallenght, sepalwidth, petallenght, petalwidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        title: Text(
          'Flower Species Predictor',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Flower Species Prediction',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: modeltypeform,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Select Machine Learning Model for Pridiction',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              activeColor: Colors.black,
                              groupValue: model,
                              value: 'gcv',
                              onChanged: (value) {
                                setState(() {
                                  model = value;
                                });
                              },
                            ),
                            Text(
                              'Grid Search CV',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Radio(
                              materialTapTargetSize:
                                  MaterialTapTargetSize.padded,
                              activeColor: Colors.black,
                              groupValue: model,
                              value: 'svc',
                              onChanged: (value) {
                                setState(() {
                                  model = value;
                                });
                              },
                            ),
                            Text(
                              'Support Vector\nClassifier',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30)),
                            minWidth: 50,
                            height: 60,
                            buttonColor: Colors.blue,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              elevation: 10,
                              onPressed: () async {
                                if (model != null) {
                                  setState(() {
                                    modeltypeform = false;
                                  });
                                  await Future.delayed(
                                      Duration(microseconds: 10));
                                  setState(() {
                                    detailsform = true;
                                  });
                                } else {
                                  Alert(
                                    context: context,
                                    title: 'Empty Field',
                                    buttons: [],
                                    desc: 'Please Select any one model',
                                    style: AlertStyle(
                                        backgroundColor: Colors.cyan),
                                  ).show();
                                }
                              },
                              child: Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: detailsform,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Enter details of the Flower',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 30),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Sepal Lenght:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                sepallenght = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 30),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Sepal Width:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                sepalwidth = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 30),
                          textInputAction: TextInputAction.next,
                          decoration: formdecoration.copyWith(
                            labelText: 'Petal Lenght:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                petallenght = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).nextFocus();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 30),
                          textInputAction: TextInputAction.done,
                          decoration: formdecoration.copyWith(
                            labelText: 'Petal Width:',
                          ),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                petalwidth = double.parse(value);
                              });
                            }
                          },
                          onSubmitted: (value) {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: ButtonTheme(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30)),
                            minWidth: 50,
                            height: 60,
                            buttonColor: Colors.blue,
                            child: RaisedButton(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              elevation: 10,
                              onPressed: () {
                                if (sepallenght != null &&
                                    sepalwidth != null &&
                                    petallenght != null &&
                                    petalwidth != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Result(
                                          model: model,
                                          sepallenght: sepallenght,
                                          sepalwidth: sepalwidth,
                                          petallenght: petallenght,
                                          petalwidth: petalwidth,
                                        ),
                                      ));
                                } else {
                                  Alert(
                                    context: context,
                                    title: 'Empty Field',
                                    buttons: [],
                                    desc: 'All details are required',
                                    style: AlertStyle(
                                        backgroundColor: Colors.cyan),
                                  ).show();
                                }
                              },
                              child: Text(
                                'Predict',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
