import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffBCD49D),
      child: Center(
          child: SpinKitChasingDots(
        color: Color(0xff5B92C8),
        size: 50.0,
      )),
    );
  }
}
