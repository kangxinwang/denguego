import 'package:denguego/screens/NotificationScreen.dart';
import 'package:denguego/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:denguego/screens/HomeScreen.dart';
import 'package:denguego/screens/SurveyScreen.dart';
import 'package:denguego/screens/SavedScreen.dart';
import 'package:denguego/screens/AccountScreen.dart';
import 'package:denguego/screens/InfoScreen.dart';

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
                  Color(0xffBCD49D),
                ],
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 45,
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
          showUnselectedLabels: false,
          onTap: _onItemTapped,
        ),
        body: _navPages[_selectedPageIndex],
      ),
    );
  }
}
