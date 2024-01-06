import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/notification.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:ecommerce_app/views/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:NotificationScreen()
    );
  }
}

