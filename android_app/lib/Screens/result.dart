import 'dart:convert';

import 'package:android_app/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Result extends StatefulWidget {
  final String model;
  final double sepallenght, sepalwidth, petallenght, petalwidth;
  Result(
      {this.model,
      this.sepallenght,
      this.sepalwidth,
      this.petallenght,
      this.petalwidth});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Result> {
  //variables
  String species, model;

  //functions
  Future<void> predict() async {
    try {
      String url =
          'https://flowerspecies.herokuapp.com/predict/?model=${widget.model}&sepallength=${widget.sepallenght}&sepalwidth=${widget.sepalwidth}&petallength=${widget.petallenght}&petalwidth=${widget.petalwidth}';
      Response result = await get(url);
      Map prediction = jsonDecode(result.body);
      setState(() {
        model = prediction['model'];
        species = prediction['flower_species'];
      });
    } catch (e) {
      Alert(
              context: context,
              title: 'Error',
              desc: 'Please try again!!',
              buttons: [],
              style: AlertStyle(backgroundColor: Colors.cyan))
          .show();
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    predict();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (species == null) {
      return Loading();
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            'Flower Species Predictor',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/$species.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'Prediction using $model',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      'Predicted Flower Species acoording to the Details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      species,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    color: Colors.blue,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.blue,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text(
                      'Predict Another Flower Species',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
