import 'package:flutter/cupertino.dart';

class Notification_Item extends StatefulWidget {
  const Notification_Item({super.key,required this.content});
  final content;
  @override
  State<Notification_Item> createState() => _Notification_ItemState();
}

class _Notification_ItemState extends State<Notification_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
              child: const Row(
                children: [
                  Image(image: AssetImage("assets/img/anh.JPG"), width: 60,height: 60,),
                  Text(widget.content)
                ],
              ),
            );
  }
}