import 'package:flutter/material.dart';

import './plant_specie_recognition.dart';
class ChooseModel extends StatefulWidget {
  static const routeName = '/chooseModel';
  
  @override
  _ChooseModelState createState() => _ChooseModelState();
}

class _ChooseModelState extends State<ChooseModel> {
  var strCloud = "Google Vision API";
  var strTflite = "Tensorflow Lite";

  Widget buildButtonTitle(BuildContext context, String title) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }

  Widget createButton(String chosenModel) {
    return RaisedButton(
        color: Colors.deepOrange[200],
        textColor: Colors.black87,
        splashColor: Colors.red,
        child: new Text(
          chosenModel,
        ),
        onPressed: () {
          var a = (chosenModel == strCloud ? 0 : 1);
          Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => PlantSpecieRecognition()),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Plant Species Recognition'),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButtonTitle(context, "Choose prefered model"),
            createButton(strCloud),
            createButton(strTflite),
          ],
        )),
      ),
    );
  }
}
