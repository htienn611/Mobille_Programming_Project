import 'package:ecommerce_app/data_source/api/fireBaseApi.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/models/order_detail.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/cart/infoshopping.dart';
import 'package:ecommerce_app/views/cart/payshopping.dart';
import 'package:ecommerce_app/views/cart/shoppingcart.dart';
import 'package:ecommerce_app/views/order/itemOrder.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:ecommerce_app/views/order/orderDetail.dart';
import 'package:ecommerce_app/views/product/listProduct.dart';
import 'package:ecommerce_app/views/product/productDetail.dart';
import 'package:ecommerce_app/views/product/productManagement.dart';
import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/notification/notification.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:ecommerce_app/views/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();
  runApp(MyApp());
}
final navigatorKey= GlobalKey<NavigatorState>();
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
      locale: const Locale('vi', 'VN'),
      home: Login(),
      navigatorKey: navigatorKey,
    );
  }
}

