import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
class AppNotification {
  var notificationPlugin = FlutterLocalNotificationsPlugin();


  // InboxStyleInformation([
  // "Aman",
  // "Harpreet",
  // "Jaspreet",
  // "Avneet",
  // "Gurpreet",
  // "Husanpreet",
  // "Harneet",
  // "Lovepreet",
  // "Satwinder",
  //
  // ],
  // contentTitle: "All messages",
  // summaryText: "See more..."
  // )

  var androidNotificationDetails = AndroidNotificationDetails(
    "Test",
    "TestName",

    // ongoing: true,
    // autoCancel: false,
    styleInformation: BigPictureStyleInformation(
      DrawableResourceAndroidBitmap("app_large"),
      contentTitle: "Big Photo",
      summaryText: "View Photo",
      largeIcon:  DrawableResourceAndroidBitmap("app_logo"),

    ),
    actions: [
      AndroidNotificationAction("100", "Reply",inputs: [
        AndroidNotificationActionInput(
          label: "write a message....",
          choices: [
            "Okey",
            "Ping me later",
            "TTYL",
            "Good Night",
          ],
          allowFreeFormInput: true,
        ),
      ]),
      AndroidNotificationAction("200", "Cancel",cancelNotification: true),
    ],
  );

  var iosNotificationDetails = DarwinNotificationDetails(
    subtitle: "My Notification",
  );

  void initializeNotificationManager(var notificationCallback) {
    var androidInitSettings = AndroidInitializationSettings("app_logo");
    var iosInitSettings = DarwinInitializationSettings();

    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSettings,
    );

    notificationPlugin.initialize(initSettings,onDidReceiveNotificationResponse: notificationCallback);

    if (Platform.isAndroid) {
      notificationPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }
  }

  Future<void> sendNotification(
      {int mId = 100, required String mTitle, required String mBody}) async {
    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    notificationPlugin.show(mId, mTitle, mBody, notificationDetails);

    //
    // tz.setLocalLocation(
    //   tz.getLocation(
    //   await FlutterTimezone.getLocalTimezone(),
    // ),);
    
    
    
    
    // notificationPlugin.periodicallyShow(id, title, body, Respon, notificationDetails);
    
    // notificationPlugin.zonedSchedule(
    //     mId,
    //     mTitle,
    //     mBody,
    //     tz.TZDateTime.now(tz.local).add(Duration(seconds: 30)),
    //     notificationDetails,
    //     uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }
}
