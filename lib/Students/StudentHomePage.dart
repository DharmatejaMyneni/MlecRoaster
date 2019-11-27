import 'package:flutter/material.dart';

class StudentHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("Students"),
      ),

      body: new Container(
        child: new Text(
          "hello students"
        ),
      ),

    );
  }
}