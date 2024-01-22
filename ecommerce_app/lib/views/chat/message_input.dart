import 'package:flutter/material.dart';

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
                  onPressed: ()async {
                  await  widget.sendMessage(message.text);
                  },
                  icon: const Icon(Icons.insert_comment_outlined)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.send))
            ],
          ),
        ],
      ),
    );
  }
}
