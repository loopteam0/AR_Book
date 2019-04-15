import 'package:flutter/material.dart';

import './routes.dart';

main(List<String> args) {
  runApp(MyApp());
}

bool getLoginState() {
  return false;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        accentColor: Colors.amber,
      ),
      initialRoute: '/',
      routes: Routes().namedRoutes(context: context),
      darkTheme: ThemeData.dark(),
      title: 'Virtual AR Book',
      //home: SignInPage(),
    );
  }
}
