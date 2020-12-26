import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class FacePainter extends CustomPainter {
ui.Image theImage;
List<Face> faces;
List<Rect> rects = [];


FacePainter(ui.Image img, List<Face> faces) {
    this.theImage = img;
    this.faces = faces;
    for (var i = 0; i < faces.length; i++) {
      rects.add(faces[i].boundingBox);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..color = Colors.green;

    canvas.drawImage(theImage, Offset.zero, Paint());
    for (var i = 0; i < faces.length; i++) {
      canvas.drawRect(rects[i], paint);
    }
  }

  @override
  bool shouldRepaint(FacePainter oldDelegate) {
    return theImage != oldDelegate.theImage || faces != oldDelegate.faces;
  }


}