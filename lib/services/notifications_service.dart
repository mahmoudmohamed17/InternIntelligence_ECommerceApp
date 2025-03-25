import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsService {
  final firebaseMessaging = FirebaseMessaging.instance;

  final androidNotificationChannel = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications',
  );
  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
    // onGeneratedRoute(RouteSettings(name: MainView.id));
  }

  // Important to enable the permission for the notifications
  // This method is called in the main.dart file
  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission();
    // final token = await firebaseMessaging.getToken();
    // debugPrint(
    //     'Token = $token'); // Important to get the Token to initialize the testing of FCM
    // initPushNotifications();
    initLocalNotifications();
  }

  // Important to initialize the push notifications from server
  Future<void> initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          sound: true,
          badge: true,
        );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            androidNotificationChannel.id,
            androidNotificationChannel.name,
            channelDescription: androidNotificationChannel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.toMap()),
      );
    });
  }

  // Important to initialize the local notifications
  Future<void> initLocalNotifications() async {
    final iOS = const DarwinInitializationSettings();
    final android = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    final settngs = InitializationSettings(iOS: iOS, android: android);
    await flutterLocalNotificationsPlugin.initialize(
      settngs,
      onDidReceiveNotificationResponse: (response) {
        final message = RemoteMessage.fromMap(jsonDecode(response.payload!));
        handleMessage(message);
      },
    );
    final platform =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();
    await platform?.createNotificationChannel(androidNotificationChannel);
  }

  // Use this in case you want to send a notification depending on an event
  void sendLocalNotification({required String title, required String body}) {
    flutterLocalNotificationsPlugin.show(
      DateTime.now().millisecondsSinceEpoch ~/
          1000, // unique id for notification
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidNotificationChannel.id,
          androidNotificationChannel.name,
          channelDescription: androidNotificationChannel.description,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  debugPrint('Title: ${message.notification?.title}');
  debugPrint('Body: ${message.notification?.body}');
  debugPrint('Payload: ${message.data}');
}
