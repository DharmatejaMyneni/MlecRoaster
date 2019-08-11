import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './GetStarted.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    _controller = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: new Container(
        height: (MediaQuery.of(context).size.height),
        width: (MediaQuery.of(context).size.width),
        decoration: new BoxDecoration(color: Colors.white),
        child: new ListView(
          padding: EdgeInsets.only(top: 150.0),
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Image.asset('assets/love.png'),
              ),
            ),
            Center(
              child: Text(
                "ATTENDANCE ",
                style: new TextStyle(
                    letterSpacing: 6.0,
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            new Container(
              decoration: new BoxDecoration(color: Colors.white),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide:
                        BorderSide(width: 4.0, color: Color(0xFF4DD0B1)),
                    insets: EdgeInsets.symmetric(horizontal: 25.0)),
                controller: _controller,
                labelColor: Colors.black,
                labelStyle:
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
                tabs: <Widget>[
                  new Tab(
                    text: 'Sign In',
                  ),
                  new Tab(
                    text: 'Sign Up',
                  )
                ],
              ),
            ),
            new Container(
              height: (MediaQuery.of(context).size.height),
              width: (MediaQuery.of(context).size.width),
              child: TabBarView(
                controller: _controller,
                children: <Widget>[LoginPage(), SignUpPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  const User(this.name);

  final String name;
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scoffoldkey = new GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey<FormState>();
  List<User> users = <User>[const User('Student'), const User('Lecturer')];

  User selectedUser;

  String _myemail;
  String _mypassword;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formkey.currentState;

    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: scoffoldkey,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<User>(
                        hint: new Text(
                          "Select Your Role ",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        isExpanded: false,
                        value: selectedUser,
                        onChanged: (User newValue) {
                          setState(() {
                            selectedUser = newValue;
                          });
                        },
                        items: users.map((User user) {
                          return new DropdownMenuItem<User>(
                            value: user,
                            child: new Text(user.name,
                                style: new TextStyle(color: Colors.black)),
                          );
                        }).toList()),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                  key: formkey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Color(0xFF4DD0B1)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF4DD0B1),
                            )),
                        validator: (val) =>
                            !val.contains('@') ? 'Invalid E-mail' : null,
                        onSaved: (val) => _myemail = val,
                      ),
                      new TextFormField(
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "password",
                            labelStyle: TextStyle(color: Color(0xFF4DD0B1)),
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFF4DD0B1))),
                        validator: (val) =>
                            val.length < 6 ? 'Password is too short' : null,
                        onSaved: (val) => _mypassword = val,
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                      ),
                      new ButtonTheme(
                        minWidth: 300.0,
                        height: 45.0,
                        child: new RaisedButton(
                          child: new Text(
                            "Login",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                          color: Color(0xFF4DD0B1),
                          onPressed: _submit,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final scoffoldkey = new GlobalKey<ScaffoldState>();
  final formkey = new GlobalKey<FormState>();
  List<User> users = <User>[const User('Student'), const User('Lecturer')];

  User selectedUser;

  String _myemail;
  String _mypassword;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    final form = formkey.currentState;

    if (form.validate()) {
      form.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: scoffoldkey,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 1.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<User>(
                      
                        hint: new Text(
                          "Select Your Role",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        isExpanded: false,
                        value: selectedUser,
                        onChanged: (User newValue) {
                          setState(() {
                            selectedUser = newValue;
                            
                          });
                        },
                        items: users.map((User user) {
                          return new DropdownMenuItem<User>(
                            value: user,
                            child: new Text(user.name,
                                style: new TextStyle(color: Colors.black)),
                          );
                        }).toList()),
                  ),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                  key: formkey,
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Color(0xFF4DD0B1)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color(0xFF4DD0B1),
                            )),
                        validator: (val) =>
                            !val.contains('@') ? 'Invalid E-mail' : null,
                        onSaved: (val) => _myemail = val,
                      ),
                      new TextFormField(
                        cursorColor: Colors.black,
                        decoration: new InputDecoration(
                            focusedBorder: new UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            labelText: "password",
                            labelStyle: TextStyle(color: Color(0xFF4DD0B1)),
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFF4DD0B1))),
                        obscureText: true,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                      ),
                      new ButtonTheme(
                        minWidth: 300.0,
                        height: 45.0,
                        child: new RaisedButton(
                          child: new Text(
                            "Login",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white),
                          ),
                          color: Color(0xFF4DD0B1),
                          onPressed: _submit,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
