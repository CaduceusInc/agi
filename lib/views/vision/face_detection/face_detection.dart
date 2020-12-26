import 'dart:io';
import 'dart:ui' as ui;
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';

import './face_painter.dart';

// ignore: must_be_immutable
class FaceDetection extends StatefulWidget {
  File file;
  FaceDetection(File file) {
    this.file = file;
  }
  @override
  _FaceDetectionState createState() => _FaceDetectionState();
}

class _FaceDetectionState extends State<FaceDetection> {
  ui.Image image;
  List<Face> faces;

  var result = '';

  void detectFaces() async {
    final FirebaseVisionImage visionImage =
        FirebaseVisionImage.fromFile(widget.file);
    final FaceDetector faceDetector = FirebaseVision.instance.faceDetector(
        FaceDetectorOptions(
            mode: FaceDetectorMode.accurate,
            enableLandmarks: true,
            enableClassification: true));
    List<Face> detectedFaces = await faceDetector.processImage(visionImage);
    for (var i = 0; i < faces.length; i++) {
      final double smileProbablity = detectedFaces[i].smilingProbability;
      print("Smiling: $smileProbablity");
    }
    faces = detectedFaces;
  }

  void loadImage(File file) async {
    final data = await file.readAsBytes();
    //load a single image frame from a byte array
    //into an Image object and store the final result value in the image
    await decodeImageFromList(data).then(
      (value) => setState(() {
        image = value;
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    detectFaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Face Detection"),
        ),
        body: (image == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: FittedBox(
                  child: SizedBox(
                      width: image.width.toDouble(),
                      height: image.width.toDouble(),
                      child: CustomPaint(painter: FacePainter(image, faces))),
                ),
              ));
  }
}
