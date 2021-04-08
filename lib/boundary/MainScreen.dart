import 'package:denguego/boundary/LoadingScreen.dart';
import 'package:denguego/boundary/NotificationScreen.dart';
import 'package:denguego/controller/ClusterManager.dart';
import 'package:denguego/controller/UserAccountManager.dart';
import 'package:denguego/shared/Constants.dart';
import 'package:flutter/material.dart';
import 'package:denguego/boundary/HomeScreen.dart';
import 'package:denguego/boundary/SurveyScreen.dart';
import 'package:denguego/boundary/SavedScreen.dart';
import 'package:denguego/boundary/AccountScreen.dart';
import 'package:denguego/boundary/InfoScreen.dart';
import 'dart:math';
import 'package:denguego/controller/ClusterManager.dart';

class MainScreen extends StatefulWidget {
  static String id = 'homePage';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 2;
  List<Widget> _navPages = <Widget>[
    InfoScreen(),
    SurveyScreen(),
    HomeScreen(),
    SavedScreen(),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  bool _alert = ClusterManager.nearByClusters.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xff5B92C8),
                  UserAccountManager.userDetails.RiskZone.contains('Low') ||
                          UserAccountManager.userDetails.RiskZone == ''
                      ? Color(0xffBCD49D)
                      : UserAccountManager.userDetails.RiskZone
                              .contains('Medium')
                          ? Color(0xffd3c598)
                          : Color(0xffba807f),
                ],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.map_outlined),
                iconSize: 35,
                onPressed: () {
                  Navigator.pushNamed(context, NotificationScreen.id);
                },
              ),
              Text(
                'DengueGo!',
                style: TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.notifications),
                iconSize: 35,
                onPressed: () {
                  Navigator.pushNamed(context, NotificationScreen.id);
                },
              ),
            ],
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff5B92C8),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.info,
                size: 35,
              ),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.poll,
                size: 35,
              ),
              label: 'Survey',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 35,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark,
                size: 35,
              ),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 35,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
        body: Stack(
          children: [
            _navPages[_selectedPageIndex],
            _alert
                ? AlertDialog(
                    backgroundColor: Color(0xffffffff),
                    title: Center(
                      child: Text('Cluster Alert!!',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Center(
                            child: Text('You are currently within 3 km of \n',
                                style: TextStyle(fontFamily: 'Montserrat')),
                          ),
                          for (var item in ClusterManager.nearByClusters)
                            Center(
                              child: Text(
                                item + '\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14),
                              ),
                            ),
                          Text('dengue clusters',
                              style: TextStyle(fontFamily: 'Montserrat')),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('Noted',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                        onPressed: () {
                          setState(() {
                            _alert = false;
                          });
                        },
                      ),
                    ],
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
