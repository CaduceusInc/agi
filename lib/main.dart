import 'package:flutter/material.dart';

import './views/vision/face_detection/face_detection_home.dart';
import './controllers/utils/transition_route_observer.dart';

void main() {
  runApp(FaceDetectionApp());
}

class FaceDetectionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Artificial Generic Intelligence',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        bottomAppBarColor: Colors.deepPurple[300],
        accentColor: Colors.deepPurple[100],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepPurple,
          splashColor: Colors.deepPurple[100],
        ),
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 45.0,
            // fontWeight: FontWeight.w400,
            color: Colors.orange,
          ),
          button: TextStyle(
            // OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans',
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: FaceDetectionHome(),
      navigatorObservers: [TransitionRouteObserver()],
              routes: {}
    );
  }
}

