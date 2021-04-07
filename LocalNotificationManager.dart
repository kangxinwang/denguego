import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:io' show Platform;
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as TZ;

class LocalNotificationManager {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var initSetting;
  var initSettingAndroid;
  BehaviorSubject<ReceiveNotification> get didReceiveLocalNotificationSubject =>
      BehaviorSubject<ReceiveNotification>();

  LocalNotificationManager.init() {
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    initializePlatform();
  }

  initializePlatform() {
    initSettingAndroid = AndroidInitializationSettings('notification_bell');
    initSetting = InitializationSettings(android: initSettingAndroid);
  }

  setOnNotificationReceive(Function onNotificationReceive) {
    didReceiveLocalNotificationSubject.listen((notification) {
      onNotificationReceive(notification);
    });
  }

  setOnNotificationClick(Function onNotificationClick) async {
    await flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: (String payload) async {
      onNotificationClick(payload);
    });
  }

  Future<void> showNotification() async {
    var androidChannel = AndroidNotificationDetails(
        'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
        importance: Importance.high, playSound: true);
    await flutterLocalNotificationsPlugin.show(0, 'Reminder!',
        'This is a reminder', NotificationDetails(android: androidChannel),
        payload: 'New Payload');
  }

  Future<void> showDailyAtTimeNotification() async {
    //DateTime time = DateTime(20,54,0);
    //var time = DateTime.parse("2021-04-08 21:42:04Z");
    //print(time);
    var androidChannel = AndroidNotificationDetails(
        'CHANNEL_ID', 'CHANNEL_NAME', 'CHANNEL_DESCRIPTION',
        importance: Importance.high, playSound: true);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      0,
      'Daily Reminder!',
      'This is a reminder',
      RepeatInterval.daily,
      NotificationDetails(android: androidChannel),
      payload: 'New Payload',
      //uiLocalNotificationDateInterpretation: null, androidAllowWhileIdle: null);
    );
  }
}

LocalNotificationManager localNotificationManager =
    LocalNotificationManager.init();

class ReceiveNotification {
  final int id;
  final String title;
  final String body;
  final String payload;

  ReceiveNotification(
      {@required this.id,
      @required this.title,
      @required this.body,
      @required this.payload});
}
