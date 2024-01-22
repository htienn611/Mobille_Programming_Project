import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.title, required this.isMe});
  final title;
  final isMe;
  @override
  Widget build(BuildContext context) {
    var wS = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: isMe?MainAxisAlignment.end:MainAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: wS*0.7),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 220, 209, 209), borderRadius: BorderRadius.circular(6)),
          child: RichText(
              softWrap: true,
              text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  text: title)),
        ),
      ],
    );
  }
}
