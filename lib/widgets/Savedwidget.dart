import 'package:flutter/material.dart';

class Savedwidget extends StatelessWidget {
  final String location;
  final int cases;
  final String zone;
  final bool isBookmarked;
  final Function savedFunc;
  Savedwidget({
    this.location,
    this.cases,
    this.zone,
    this.isBookmarked,
    this.savedFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        elevation: 3,
        color: zone == "Safe"
            ? Color(0xffBCD49D)
            : zone == "Medium Risk"
                ? Color(0xffdec649)
                : Color(0xffd26666),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      location,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "${cases.toString()} cases",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${zone} Zone",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),
              IconButton(
                icon: isBookmarked
                    ? Icon(
                        Icons.bookmark,
                      )
                    : Icon(
                        Icons.bookmark_border,
                      ),
                onPressed: savedFunc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
