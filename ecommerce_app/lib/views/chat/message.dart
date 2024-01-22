import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(6)),
      child: RichText(
          softWrap: true,
          text: const TextSpan(
              style: TextStyle(color: Colors.black, fontSize: 18),
              text: "ng phần khi ngườ jashdad")),
    );
  }
}
