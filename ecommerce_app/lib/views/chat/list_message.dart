import 'package:ecommerce_app/views/chat/message.dart';
import 'package:flutter/material.dart';
class ListMessage extends StatelessWidget {
  const ListMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Message(),
          Message(),
          Message(),
        ],
      ),
    );
  }
}

