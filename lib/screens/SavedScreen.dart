import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Image.asset(
            'images/location.png',
          ),
        ),
        Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(left: 2.0),
                child: FloatingActionButton(
                  child: Icon(Icons.bookmark_outlined),
                ),
              ),
              Text(
                'Kallang',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                '12 cases',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'Safe Zone',
                style: TextStyle(
                  color: Color(0xffBCD49D),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              )
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10.0, top: 10.0),
                child: FloatingActionButton(
                  child: Icon(Icons.bookmark_outlined),
                ),
              ),
              Text(
                'Woodlands',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                '180 cases',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'Danger Zone',
                style: TextStyle(
                  color: Color(0xffFA847E),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              )
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.only(left: 6.0, top: 10.0),
                child: FloatingActionButton(
                  child: Icon(Icons.bookmark_outlined),
                ),
              ),
              Text(
                'Jurong East',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                '50 cases',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                'Risk Zone',
                style: TextStyle(
                  color: Color(0xffFED065),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
