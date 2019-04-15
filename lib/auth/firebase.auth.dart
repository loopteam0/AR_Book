// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser userInsatance;

  Future<FirebaseUser> handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth
        .signInWithCredential(credential)
        .then((user) => userInsatance = user);

    print("signed in " + userInsatance.displayName);

    return user;
  }

  Future<GoogleSignInAccount> handleSignOut() {
    return _googleSignIn.signOut();
  }

  Future<FirebaseUser> createUser({String email, String password}) async {
    final FirebaseUser user = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user;
  }

  Future<FirebaseUser> signin({String email, String password}) async {
    final FirebaseUser user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return user;
  }
}
