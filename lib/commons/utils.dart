import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';
import 'package:fluttertoast/fluttertoast.dart';

Drawer drawer = Drawer();

showSnackBar({context, String message}) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 5),
  ));
}

openInstalledApp(String packageName) async {
  bool isInstalled = await DeviceApps.isAppInstalled(packageName);
  if (isInstalled) {
    DeviceApps.openApp(packageName);
  } else if (!isInstalled) {
    Fluttertoast.showToast(msg: 'App not installed');
  }
}

///popup menu builder
