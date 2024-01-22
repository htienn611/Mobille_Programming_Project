import 'package:ecommerce_app/views/chat/avt.dart';
import 'package:ecommerce_app/views/chat/list_message.dart';
import 'package:flutter/material.dart';

class MessageSection extends StatelessWidget {
  MessageSection({super.key,required this.isMe});
  bool isMe = true;

  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;
    List<Widget> items = [const Avatar(), const ListMessage()];
    return Row(
      mainAxisAlignment:isMe?MainAxisAlignment.end: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: sW * 0.7,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: isMe?items.reversed.toList():items
              ),
        ),
      ],
    );
  }
}
