import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final FirebaseUser user;

  CustomDrawer(this.user);
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<CustomDrawer> {
  FirebaseUser user;
  @override
  void initState() {
    user = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text(user == null ? 'Unknown error' : user.email),
          accountName: Text(user == null ? 'Unknown error' : user.displayName),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Theme.of(context).accentColor,
            backgroundImage: NetworkImage(user.photoUrl),
          ),
        ),
        ListTile(
          title: Text('Chemistry'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/chemistry');
          },
        ),
        ListTile(
          title: Text('Biology'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/biology');
          },
        ),
        ListTile(
          title: Text('Physics'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/physics');
          },
        ),
        ListTile(
          title: Text('Agriculture'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/agric');
          },
        ),
      ],
    );
  }
}
