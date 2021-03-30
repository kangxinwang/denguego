import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/controller/ToggleViewManager.dart';
import 'package:denguego/entity/UserAccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ClusterManager.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    final user = Provider.of<UserAccount>(context);
    populate();
    if (user == null) {
      return Authenticate();
    } else {
      return MainScreen();
    }
  }

  Future populate() async {
    await ClusterManager.getData();
  }
}
