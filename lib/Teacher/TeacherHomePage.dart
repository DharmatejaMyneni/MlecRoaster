import 'package:flutter/material.dart';

class TeacherHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        title: new Text("teachers"),
      ),

      body: new Container(
        child: new Text(
          "hello teachers"
        ),
      ),

    );
  }
}