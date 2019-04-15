import 'package:flutter/material.dart';

export 'package:fluttertoast/fluttertoast.dart';

export './courses/courses.ui.dart';
export './login/sign.ui.dart';
export './books/agric.book.dart';
export './books/biology.book.dart';
export './books/physics.book.dart';
export './books/chemistry.book.dart';

import './courses/courses.ui.dart';
import './login/sign.ui.dart';
import './books/agric.book.dart';
import './books/biology.book.dart';
import './books/physics.book.dart';
import './books/chemistry.book.dart';

class Routes {
  namedRoutes({BuildContext context}) {
    return {
      '/': (context) => SignInPage(),
      '/courses': (context) => CoursesPage(),
      '/chemistry': (context) => ChemistryBook(),
      '/biology': (context) => BiologyBook(),
      '/physics': (context) => PhysicsBook(),
      '/agric': (context) => AgricBook(),
    };
  }

  navigate({context, page}) {
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
