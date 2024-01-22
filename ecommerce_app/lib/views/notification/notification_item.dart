import 'package:flutter/cupertino.dart';

class Notification_Item extends StatefulWidget {
  const Notification_Item({super.key});

  @override
  State<Notification_Item> createState() => _Notification_ItemState();
}

class _Notification_ItemState extends State<Notification_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
              child: const Row(
                children: [
                  Image(image: AssetImage("assets/img/anh.jpg"), width: 60,height: 60,),
                  Text("Đơn hàng của bạn đang trong quá trình vận chuyển")
                ],
              ),
            );
  }
}