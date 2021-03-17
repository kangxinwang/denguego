import 'package:denguego/screens/MainScreen.dart';
import 'package:denguego/authenticate/authenticate.dart';
import 'package:denguego/home/home.dart';
import 'package:denguego/models/AppUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    final user = Provider.of<AppUser>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return MainScreen();
    }
  }
}
