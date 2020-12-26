import 'dart:io';

import 'package:agi/controllers/widgets/floating_action_buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PlantSpecieRecognition extends StatefulWidget {
  static const routeName = "/plant_specie_recognition";
  @override
  _PlantSpecieRecognitionState createState() => _PlantSpecieRecognitionState();
}

class _PlantSpecieRecognitionState extends State<PlantSpecieRecognition> {
  var image;
  bool busy = false;
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    List<Widget> stackedResult = [];
    Size size = MediaQuery.of(context).size;

    Future chooseImageGallery() async {
      PickedFile file = await imagePicker.getImage(
        source: ImageSource.gallery,
      );
      final image = File(file.path);
      if (image == null) return;
      setState(() {
        busy = true;
      });
    }

    stackedResult.add(Positioned(
      child: image == null ? Text('No image selected') : Image.file(image),
      top: 0.0,
      left: 0.0,
      width: size.width - 15,
    ));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Plant Specie Recognition'),
          centerTitle: true,
        ),
        floatingActionButton: buildImageGalleryButton(context, chooseImageGallery),
        body: Stack(
          children: stackedResult,
        ),
      ),
    );
  }
}
