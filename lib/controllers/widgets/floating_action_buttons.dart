import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';


Widget buildImageGalleryButton(context, Future gallery()) {
  return Builder(
    builder: (context) => FabCircularMenu(
      // key: fabKey,
      // Cannot be `Alignment.center`
      alignment: Alignment.bottomRight,
      ringColor: Colors.lightGreen[50],
      ringDiameter: 450.0,
      ringWidth: 150.0,
      fabSize: 74.0,
      fabElevation: 28.0,
      fabIconBorder: CircleBorder(),
      // Also can use specific color based on wether
      // the menu is open or not:
      fabOpenColor: Colors.lightGreen[700],
      fabCloseColor: Colors.green[600],
      // These properties take precedence over fabColor
      fabColor: Colors.green[600],
      fabOpenIcon: Icon(Icons.menu, color: Colors.white),
      fabCloseIcon: Icon(Icons.close, color: Colors.white),
      fabMargin: const EdgeInsets.all(16.0),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            _showTopSnackBar(context, "Select an image from your gallery");
            // Navigator.pushReplacementNamed(context, routeName);
          },
          shape: CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: Icon(Icons.image, color: Colors.green),
        ),
        
      ],
    ),
  );
}

// void _showSnackBar(BuildContext context, String message) {
//   Scaffold.of(context).showSnackBar(SnackBar(
//     content: Text(message),
//     duration: const Duration(milliseconds: 1000),
//   ));
// }

void _showTopSnackBar(BuildContext context, String message) {
  showTopSnackBar(
    context,
    CustomSnackBar.success(
      message: "$message",
    ),
  );
}