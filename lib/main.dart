import 'package:flutter/material.dart';
import 'package:flutter_animated_loading/animate_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: new Color(0xFFFFCB05),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnimatedLoading(),
    );
  }
}


