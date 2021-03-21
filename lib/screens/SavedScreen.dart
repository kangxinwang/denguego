import 'package:flutter/material.dart';

class SavedScreen extends StatefulWidget {
  @override
  _SavedScreenState createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  List<LocationCard> locationList = [];
  void removeLocationCard(index) {
    setState(() {
      locationList.remove(index);
    });
  }

  @override
  void initState() {
    super.initState();
    locationList = List.generate(
        2, (index) => LocationCard(removeLocationCard, index: index));
  }

  @override
  Widget build(BuildContext context) {
    print('build + ${locationList.length}');
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Image.asset('images/location.png', height: 280, width: 280),
          ),
          ...locationList,
        ],
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  int index;
  final Function(LocationCard) removeLocationCard;

  LocationCard(this.removeLocationCard, {Key key, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.only(left: 3.0),
              child: FloatingActionButton(
                child: Icon(Icons.bookmark_outlined),
                onPressed: () {
                  removeLocationCard(this);
                },
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
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Container(
        //       padding: EdgeInsets.only(left: 10.0, top: 10.0),
        //       child: FloatingActionButton(
        //         child: Icon(Icons.bookmark_outlined),
        //         onPressed: () {
        //           removeLocationCard(this);
        //         },
        //       ),
        //     ),
        //     Text(
        //       'Woodlands',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Montserrat',
        //       ),
        //     ),
        //     Text(
        //       '180 cases',
        //       style: TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Montserrat',
        //       ),
        //     ),
        //     Text(
        //       'Danger Zone',
        //       style: TextStyle(
        //         color: Color(0xffFA847E),
        //         fontWeight: FontWeight.bold,
        //         fontFamily: 'Montserrat',
        //       ),
        //     )
        //   ],
        // ),
      ],
    );
  }
}
