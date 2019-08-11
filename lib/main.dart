import 'package:flutter/material.dart';
import 'package:mlec_roster/starters/GetStarted.dart';
import './starters/Login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.deepPurple), home: GetStarted());
    }
}