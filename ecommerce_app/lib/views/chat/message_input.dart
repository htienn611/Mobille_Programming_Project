import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MessageInput extends StatefulWidget {
  MessageInput({super.key, required this.sendMessage});
  Function(String) sendMessage;
  @override
  State<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  var message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              maxLines: null,
              controller: message,
              decoration: const InputDecoration(
                  hintText: "Nhập tin nhắn...",
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.insert_comment_outlined)),
              IconButton(
                  onPressed: () {
                    widget.sendMessage(message.text);
                    message.text = '';
                    setState(() {});
                  },
                  icon: const Icon(Icons.send))
            ],
          ),
        ],
      ),
    );
  }
}
