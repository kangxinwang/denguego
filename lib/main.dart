import 'package:denguego/screens/ForgotPasswordScreen.dart';
import 'package:denguego/screens/LoginScreen.dart';
import 'package:denguego/screens/NotificationScreen.dart';
import 'package:denguego/screens/SignupScreen.dart';
import 'package:denguego/screens/GoogleMapsScreen.dart';
import 'package:denguego/services/auth.dart';
import 'package:denguego/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:denguego/screens/MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'models/AppUser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Dengue Go',
        initialRoute: Wrapper.id,
        routes: {
          Wrapper.id: (context) => Wrapper(),
          MainScreen.id: (context) => MainScreen(),
          ForgotPasswordScreen.id: (context) => ForgotPasswordScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          NotificationScreen.id: (context) => NotificationScreen(),
          GoogleMapScreen.id: (context) => GoogleMapScreen(),
        },
      ),
    );
  }
}
