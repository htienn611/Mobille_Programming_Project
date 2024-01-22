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
    var hS = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 224, 84, 75),
        actions: const [ChatAppbarItems()],
      ),
      body: SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: hS * 0.75,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                MessageSection(isMe: true),
                MessageSection(isMe: true),
                MessageSection(isMe: true)
              ]),
            ),
          ),
          const MessageInput()
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
