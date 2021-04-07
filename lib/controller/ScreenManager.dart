import 'package:denguego/boundary/LoadingScreen.dart';
import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/controller/AuthenticateManager.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'package:denguego/controller/ToggleViewManager.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/entity/UserAccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenManager extends StatelessWidget {
  static String id = 'ScreenManager';
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    final user = Provider.of<UserAccount>(context);

    final AuthenticateManager _auth = AuthenticateManager();
    // populate();
    return FutureBuilder(
        future: ClusterManager.getAllLocations(),
        builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
          if (snapshot.hasData) {
            if (user == null) {
              return Authenticate();
            } else {
              return MainScreen();
            }
          } else
            return LoadingScreen();
        });
  }
}
