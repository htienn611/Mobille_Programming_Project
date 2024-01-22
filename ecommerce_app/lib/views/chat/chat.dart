import 'package:ecommerce_app/views/chat/chat_appbar_items.dart';
import 'package:ecommerce_app/views/chat/message_input.dart';
import 'package:ecommerce_app/views/chat/message_section.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Cuộn xuống vị trí cuối cùng khi trang được load
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          actions: const [ChatAppbarItems()],
        ),
        body: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            padding: const EdgeInsets.only(bottom: 80),
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MessageSection(isMe: true),
                    MessageSection(isMe: false),
                    MessageSection(isMe: false),
                  ]),
            ),
          ),
          const MessageInput()
        ]));
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
