import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../commons/utils.dart';

class AgricBook extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: agricBody,
    );
  }
}

var agricBody = CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      floating: false,
      pinned: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Agriculture'),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/vegetables.png',
              fit: BoxFit.cover,
              height: 250.0,
            ),
            // This gradient ensures that the toolbar icons are distinct
            // against the background image.
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, -0.4),
                  colors: <Color>[Color(0x60000000), Color(0x00000000)],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildListDelegate([
        Container(
            padding:
                EdgeInsets.only(top: 10, bottom: 30.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  initiallyExpanded: true,
                  title: const Text('Section 1: Farm'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Lesson 1: Farm Tools'),
                      onTap: () {
                        //Open unity activity
                        openInstalledApp('com.Arbook.agric').then((res) =>
                            Fluttertoast.showToast(
                                msg: 'lesson 1: Farm Tools'));
                      },
                    ),
                    ListTile(
                      title: Text('Lesson 2'),
                    ),
                    ListTile(
                      title: Text('Lesson 3'),
                    ),
                    ListTile(
                      title: Text('Lesson 4'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text('Section 2: Plants'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Lesson 1'),
                    ),
                    ListTile(
                      title: Text('Lesson 2'),
                    ),
                    ListTile(
                      title: Text('Lesson 3'),
                    ),
                    ListTile(
                      title: Text('Lesson 4'),
                    )
                  ],
                ),
              ],
            ))
      ]),
    )
  ],
);
