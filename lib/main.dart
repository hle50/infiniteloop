import 'package:InfinityLoop/AdManager.dart';
import 'package:InfinityLoop/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    FirebaseAdMob.instance.initialize(appId: AdManager.appId);
    return MaterialApp(
      title: 'Love Quotes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'IndieFlower'
      ),
      home: AppHome(),
    );
  }
}
