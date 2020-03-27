import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            "image/1.jpg",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              Form(
                  child: Theme(
                data: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(
                    40.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(labelText: "Enter Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: "Enter Password"),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      MaterialButton(
                        height: 40.0,
                        minWidth: 90.0,
                        onPressed: () => {},
                        color: Colors.teal,
                        textColor: Colors.white,
                        child: Icon(Icons.forward),
                        splashColor: Colors.redAccent,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
