import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notification_Item extends StatefulWidget {
  const Notification_Item({super.key, required this.content});
  final content;
  @override
  State<Notification_Item> createState() => _Notification_ItemState();
}

class _Notification_ItemState extends State<Notification_Item> {
  @override
  Widget build(BuildContext context) {
    return 
       Row(
        children: [
          Image(
            image: AssetImage("assets/img/anh.JPG"),
            width: 60,
            height: 60,
          ),
          Container(
            constraints:
                BoxConstraints(maxWidth: MediaQuery.of(context).size.width-70),
            child: RichText(
                softWrap: true,
                text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    text: widget.content)),
          ),
        ],
      );
    
  }
}
