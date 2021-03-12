import 'package:flutter/material.dart';
import 'package:denguego/screens/homeScreen.dart';
import 'package:denguego/screens/surveyScreen.dart';
import 'package:denguego/screens/savedScreen.dart';
import 'package:denguego/screens/accountScreen.dart';
import 'package:denguego/screens/infoScreen.dart';

class homePage extends StatefulWidget {
  static String id = 'homePage';
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedPageIndex = 2;
  List<Widget> _navPages = <Widget>[
    infoScreen(),
    surveyScreen(),
    homeScreen(),
    savedScreen(),
    accountScreen(),
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
          backgroundColor: Color.fromARGB(200, 91, 146, 200),
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
                ),
              ),
              Icon(
                Icons.notifications,
                size: 35,
              )
            ],
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(200, 91, 146, 200),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_align_justify),
              label: 'Survey',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.save),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedPageIndex,
          selectedItemColor: Colors.grey[800],
          unselectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
        body: _navPages[_selectedPageIndex],
      ),
    );
  }
}
