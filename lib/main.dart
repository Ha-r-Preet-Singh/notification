import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_46/notification_manager.dart';

import 'package:timezone/data/latest.dart' as tzl;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppNotification notificationManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tzl.initializeTimeZones();




    notificationManager = AppNotification();
    notificationManager.initializeNotificationManager(
            (NotificationResponse details){
      Navigator.push(context, MaterialPageRoute(builder:(context) => Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
        ),
      ),));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"), 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),
                onPressed: (){
              notificationManager.sendNotification(
                  mTitle: "Message from Harpreet Singh",
                  mBody: "Hey!!",
              );
            }, child: Text("Notify",style: TextStyle(color: Colors.white),)),
          ],
        ),
      ),
    );
  }
}
