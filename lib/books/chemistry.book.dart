import 'package:example/commons/utils.dart';
import 'package:flutter/material.dart';

import '../routes.dart';

class ChemistryBook extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: chemistryBody,
    );
  }
}

var chemistryBody = CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Chemistry'),
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/chemistry.png',
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
                  title: const Text('Section 1: Inorganic Chemistry'),
                  children: <Widget>[
                    ListTile(
                      title: Text('Lesson 1: Laboratory Equipments'),
                      onTap: () {
                        openInstalledApp('com.Arbook.chemistry').then((res) =>
                            Fluttertoast.showToast(
                                msg: 'lesson 1: Laboratory Equipments'));
                      },
                    ),
                    ListTile(
                      title: Text('Lesson 2: Basic Titration'),
                      onTap: () {
                        openInstalledApp('com.me.arbt1').then((res) =>
                            Fluttertoast.showToast(
                                msg: 'lesson 1: Basic Titration'));
                      },
                    ),
                    ListTile(
                      title: Text('Lesson 3: Redox Titration '),
                    ),
                    ListTile(
                      title: Text('Lesson 4: Per-Manganate Titration'),
                    )
                  ],
                ),
                ExpansionTile(
                  title: const Text('Section 2: Organic Chemistry'),
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
                ExpansionTile(
                  title: const Text('Section 3: Physical Chemistry'),
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
