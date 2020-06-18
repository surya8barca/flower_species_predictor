import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  final String model;
  final double sepallenght,sepalwidth,petallenght,petalwidth;
  Result({this.model,this.sepallenght,this.sepalwidth,this.petallenght,this.petalwidth});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Result> {
  //variables

  //functions

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
      body: Builder(builder: (context) => 
      SingleChildScrollView(
        child: Container(
          
        ),
      ),
      ),
    );
  }
}