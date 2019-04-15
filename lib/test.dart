import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter TabBar',
      home: new Home(),
      theme: new ThemeData(primaryColor: Colors.black),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController tabController;

  @override
  Widget build(BuildContext context) {
    tabController = new TabController(length: 2, vsync: this);

    var tabBarItem = new TabBar(
      tabs: [
        new Tab(
          icon: new Icon(Icons.list),
        ),
        new Tab(
          icon: new Icon(Icons.grid_on),
        ),
      ],
      controller: tabController,
      indicatorColor: Colors.white,
    );

    var listItem = new ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return new ListTile(
          title: new Card(
            elevation: 5.0,
            child: new Container(
              alignment: Alignment.center,
              margin: new EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: new Text("ListItem $index"),
            ),
          ),
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("ListView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ));
          },
        );
      },
    );

    var gridView = new GridView.builder(
        itemCount: 20,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.center,
                child: new Text('Item $index'),
              ),
            ),
            onTap: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );
            },
          );
        });

    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text("Flutter TabBar"),
          bottom: tabBarItem,
        ),
        body: new TabBarView(
          controller: tabController,
          children: [
            listItem,
            gridView,
          ],
        ),
      ),
    );
  }
}

// Alias name: androiddebugkey
// Creation date: Mar 16, 2019
// Entry type: PrivateKeyEntry
// Certificate chain length: 1
// Certificate[1]:
// Owner: C=US, O=Android, CN=Android Debug
// Issuer: C=US, O=Android, CN=Android Debug
// Serial number: 1
// Valid from: Sat Mar 16 05:43:51 UTC 2019 until: Mon Mar 08 05:43:51 UTC 2049
// Certificate fingerprints:
//          MD5:  60:74:F8:E9:A6:9A:8C:B3:51:DD:10:37:BB:D4:77:59
//          SHA1: 92:3C:7C:4E:31:91:7B:88:2C:15:BF:0E:BD:37:FA:B4:94:33:96:8D
//          SHA256: A6:30:68:F5:53:23:DC:21:5B:5D:A6:5E:E2:E9:DD:88:4D:E9:96:BF:45:F2:AD:1D:B0:20:75:56:D7:42:19:61
// Signature algorithm name: SHA1withRSA
// Subject Public Key Algorithm: 1024-bit RSA key
// Version: 1

// Warning:
// The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore C:\Users\Shadow\.android\debug.keystore -destkeystore C:\Users\Shadow\.android\debug.keystore -deststoretype pkcs12".
