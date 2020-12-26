import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'face_detection.dart';

class FaceDetectionHome extends StatefulWidget {
  static const routeName = "/face_detection_home";
  @override
  _FaceDetectionHomeState createState() => _FaceDetectionHomeState();
}

class _FaceDetectionHomeState extends State<FaceDetectionHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget buildRowTitle(BuildContext context, String title) {
    return Center(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline5,
      ),
    ));
  }

  Widget createButton(String imgSource) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          splashColor: Colors.blueGrey,
          onPressed: () {
            onPickImageSelected(imgSource);
          },
          child: new Text(imgSource)),
    ));
  }

  Widget buildSelectImageRowWidget(BuildContext context) {
    return Row(
      children: <Widget>[
        createButton('Camera'),
        createButton('Gallery'),
      ],
    );
  }

  void onPickImageSelected(String source) async {
    var imageSource;
    final ImagePicker imagePicker = ImagePicker();

    if (source == "Camera") {
      imageSource = ImageSource.camera;
    } else {
      imageSource = ImageSource.gallery;
    }
    final scaffold = _scaffoldKey.currentState;
    try {
      PickedFile pickedFile = await imagePicker.getImage(source: imageSource);
      if (pickedFile == null) {
        throw Exception('File is not available');
      }
      // This is different from the book. Differences are hereafter marked with a "<>"
      final file = File(pickedFile.path); // convert the picked file format to the acceptable file format
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => FaceDetection(file)),
      );
    } catch (e) {
      scaffold.showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Detect Faces"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildRowTitle(context, 'Select an Image'),
            buildSelectImageRowWidget(context)
          ],
        ),
      ),
    );
  }
}
