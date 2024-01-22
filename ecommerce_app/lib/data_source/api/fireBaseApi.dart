import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final FirebaseMessaging _cloudMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotification =
      FlutterLocalNotificationsPlugin();

  Future<void> handleBackgroundMessage(RemoteMessage message) async {
    _showLocalNotification(message);
  }

  void handleMessage(RemoteMessage? message) {
    if (message != null) {
      _showLocalNotification(message);
    }
  }

  Future<void> initPushNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    await _initializeLocalNotification();
  }

  Future<void> _initializeLocalNotification() async {
    await _localNotification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@drawable/ic_launcher'),
      ),
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        handleMessage(message);
      },
    );
    final platform =
        _localNotification.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await platform?.createNotificationChannel(_createNotificationChannel());
  }

  Future<void> initNotification() async {
    await _cloudMessaging.requestPermission();
    final fCMToken = await _cloudMessaging.getToken();
    print("Token: $fCMToken");
    initPushNotification();
    await _initializeLocalNotification();
  }

  AndroidNotificationChannel _createNotificationChannel() {
    return const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Channel',
      description: 'This channel',
      importance: Importance.defaultImportance,
    );
  }

  void _showLocalNotification(RemoteMessage message) {
    final noti = message.notification;
    if (noti != null) {
      _localNotification.show(
        noti.hashCode,
        noti.title,
        noti.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _createNotificationChannel().id,
            _createNotificationChannel().name,
            channelDescription: _createNotificationChannel().description,
            icon: '@drawable/ic_launcher',
          ),
        ),
        payload: jsonEncode(message.data),
      );
    }
  }
}
