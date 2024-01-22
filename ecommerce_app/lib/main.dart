import 'package:ecommerce_app/presenters/fireBaseApi.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/views/cart/cart.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:ecommerce_app/views/routers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
void main() async{
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
  await FirebaseApi().initNotification();
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
        fontFamily: 'Roboto-Black'
      ),
      locale: const Locale('vi', 'VN'),


      home: CartScreen(phoneNumber: '0327728030',),
    );}
}




