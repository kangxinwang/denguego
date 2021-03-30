import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/entity/UserAccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    final user = Provider.of<UserAccount>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return MainScreen();
    }
  }
}
