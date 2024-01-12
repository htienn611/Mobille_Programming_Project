import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/cart/infoshopping.dart';
import 'package:ecommerce_app/views/cart/payshopping.dart';
import 'package:ecommerce_app/views/cart/shoppingcart.dart';
import 'package:ecommerce_app/views/order/itemOrder.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:ecommerce_app/views/order/orderDetail.dart';
import 'package:ecommerce_app/views/product/listProduct.dart';
import 'package:ecommerce_app/views/product/oneProduct.dart';
import 'package:ecommerce_app/views/product/productManagement.dart';
import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/notification/notification.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:ecommerce_app/views/register.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

void main() async {
  final conn = PostgreSQLConnection(
    'localhost',
    5432,
    'tech_computer',
    username: 'postgres',
    password: '0949866367T!en',
  );
  await conn.open();
  print('success');
  // query
  await conn.close();
  print('connection close');
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
      home: const ChatScreen(),
    );
  }
}
