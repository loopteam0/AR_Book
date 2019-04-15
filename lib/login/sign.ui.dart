import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

import '../routes.dart';
import '../auth/firebase.auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _SignInPageState() {
    print(_auth.currentUser());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool loading = false;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // Container(),
          _midleScreen(context),
          _bottomWidget(),
        ],
      ),
    );
  }
}

// middle widget

Widget _midleScreen(context, {Widget spinner, Function callback}) {
  return Expanded(
    child: new Container(
      padding: new EdgeInsets.all(1.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.book,
            size: 100.0,
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text(
              'EASY LEARN',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
          GoogleSignInButton(
            borderRadius: 10.0,
            darkMode: false,
            onPressed: () {
              // callback();
              Auth().handleSignIn().then((FirebaseUser user) {
                Routes().navigate(
                    context: context,
                    page: CoursesPage(
                      user: user,
                    ));
                print(user);
                Fluttertoast.showToast(
                  msg: "Signed in as " + user.displayName,
                );
              }).catchError((e) => Fluttertoast.showToast(msg: e));
            },
          ),
          // spinner,
        ],
      ),
    ),
  );
}

// bottom widget

Widget _bottomWidget() {
  return new Container(
    padding: EdgeInsets.all(10.0),
    height: 40.0,
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.ac_unit),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('DEVELOPED BY RANGER TECHNOLOGIES.'),
        ),
      ],
    ),
  );
}
