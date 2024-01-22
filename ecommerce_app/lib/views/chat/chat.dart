import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/views/chat/chat_appbar_items.dart';
import 'package:ecommerce_app/views/chat/message_input.dart';
import 'package:ecommerce_app/views/chat/message_section.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ScrollController _scrollController;
  late IO.Socket socket;

  void sendMessage(String message) {
    socket.emit('chat message', message);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Cuộn xuống vị trí cuối cùng khi trang được load
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });

    // Kết nối với máy chủ WebSocket
    socket =
        IO.io(host, IO.OptionBuilder().setTransports(['websocket']).build());

    // Kiểm tra trạng thái kết nối
    socket.on('connect', (_) {
      print('Connected');
      socket.emit('chat message', 'test');
    });

    // Đăng ký sự kiện 'chat message'
    socket.on('chat message', (msg) {
      // ignore: avoid_print
      print('Nhận được tin nhắn: $msg');
    });

    socket.onDisconnect((_) {
      setState(() {
        // ignore: avoid_print
        print("disconnected");
      });
    });
    // ignore: avoid_print
    print(socket.connected);
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          MessageInput(
            sendMessage: sendMessage,
          )
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
    socket.disconnect();
  }
}
