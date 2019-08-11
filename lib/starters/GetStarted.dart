import 'package:flutter/material.dart';
import 'package:mlec_roster/starters/Login.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        
        decoration: new BoxDecoration(color: Color(0xFF4DD0B1)),
        padding: EdgeInsets.only(top: 200.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Image.asset('assets/students.gif'),
            SizedBox(height: 45.0),
            new Center(
              child: new Text(
                "MLEC ROSTER",
                style: new TextStyle(
                    fontSize: 38.0,
                    shadows: [
                      Shadow(
                          offset: Offset(4.0, 4.0),
                          blurRadius: 20.0,
                          color: Colors.black)
                    ],
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50.0),
            new Center(
                child: new ButtonTheme(
              minWidth: 200.0,
              child: RaisedButton(
                child: Text(
                  "GET IN",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      new MaterialPageRoute(builder: (context) => new Login()
                      ));
                },
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
