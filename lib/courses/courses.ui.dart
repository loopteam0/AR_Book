import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

import '../routes.dart';
import '../commons/drawer.dart';
import '../auth/firebase.auth.dart';

class CoursesPage extends StatefulWidget {
  final FirebaseUser user;
  CoursesPage({this.user});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  FirebaseUser user;

  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        drawer: Drawer(
          child: CustomDrawer(user),
        ),
        appBar: AppBar(
          title: Text('COURSES'),
          centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (dynamic value) {
                  _onPopupSelect(context: context, value: value);
                },
                tooltip: 'More',
                icon: Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                      PopupMenuItem(
                        child: Text('Exit'),
                        value: 'exit',
                      ),
                      PopupMenuItem(
                        child: Text('Log out'),
                        value: 'logout',
                      ),
                    ])
          ],
        ),
        body: _Courses(),
      ),
    );
  }
}

// popupmenu onselecr function
_onPopupSelect({context, value}) {
  switch (value) {
    case 'logout':
      _showAlertDialog(context);
      break;
    case 'exit':
      exit(0);
      break;
    default:
      Fluttertoast.showToast(msg: 'Unknown Error');
  }
}

// display list of courses
class _Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(10.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: <Widget>[
          GestureDetector(
            child: makeGridCell(
              title: 'Chemistry',
              imagePath: 'assets/images/chemistry.png',
            ),
            onTap: () {
              Routes().navigate(context: context, page: ChemistryBook());
            },
          ),
          GestureDetector(
            child: makeGridCell(
                title: 'Biology', imagePath: 'assets/images/microscope.png'),
            onTap: () {
              Routes().navigate(context: context, page: BiologyBook());
            },
          ),
          GestureDetector(
            child: makeGridCell(
                title: 'Physics', imagePath: 'assets/images/magnet.png'),
            onTap: () {
              Routes().navigate(context: context, page: PhysicsBook());
            },
          ),
          GestureDetector(
            child: makeGridCell(
                title: 'Agriculture',
                imagePath: 'assets/images/vegetables.png'),
            onTap: () {
              Routes().navigate(context: context, page: AgricBook());
            },
          ),
        ]);
  }
}

// Dialog
Future<void> _showAlertDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Log out Alert!'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Are you sure you want to log out ?'),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('NO'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text('YES'),
            onPressed: () {
              Navigator.of(context).pop();
              Auth().handleSignOut().then((data) {
                Routes().navigate(context: context, page: SignInPage());
                print(data);
              });
            },
          ),
        ],
      );
    },
  );
}

// card widget
Widget makeGridCell({String title, String subtitle, String imagePath}) {
  return GridTile(
    child: Container(
        padding: EdgeInsets.all(10.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
        )),
    footer: GridTileBar(
      backgroundColor: Colors.black45,
      title: _gridTitleText(title),
      subtitle: _gridTitleText('subtitle'),
      // trailing: IconButton(
      //   onPressed: () {},
      //   icon: Icon(
      //     Icons.favorite,
      //     color: Colors.white,
      //   ),
      // ),
    ),
  );
}

Widget _gridTitleText(final text) {
  return FittedBox(
    fit: BoxFit.scaleDown,
    alignment: Alignment.bottomCenter,
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

// <div>Icons made by <a href="https://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" 			    title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" 			    title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
