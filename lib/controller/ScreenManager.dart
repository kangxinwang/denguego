import 'package:denguego/boundary/LoadingScreen.dart';
import 'package:denguego/boundary/MainScreen.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'package:denguego/controller/ToggleViewManager.dart';
import 'package:denguego/entity/UserAccount.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  static String id = 'wrapper';
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widget
    final user = Provider.of<UserAccount>(context);
    // populate();
    if (user == null) {
      return Authenticate();
    } else {
      // List<String> ClusterList= await ClusterManager.getAllLocations();
      return FutureBuilder(
          future: ClusterManager.getAllLocations(),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData)
              return MainScreen();
            else
              return LoadingScreen();
          });
    }
  }
}
