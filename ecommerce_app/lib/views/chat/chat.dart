import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/models/conversation.dart';
import 'package:ecommerce_app/models/messages.dart';
import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/presenters/conversation_presenter.dart';
import 'package:ecommerce_app/presenters/message_presenter.dart';
import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:ecommerce_app/views/chat/chat_appbar_items.dart';
import 'package:ecommerce_app/views/chat/message.dart';
import 'package:ecommerce_app/views/chat/message_input.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.phoneNumber, this.us1 = '0914105327'});
  final String phoneNumber;
  var us1 ;
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> implements UserView {
  late ScrollController _scrollController;
  TextEditingController message = TextEditingController();
  late io.Socket socket;
  late User us;
  late Conversation conv;

  List<MessageItem> messLst = List.filled(
      0, const MessageItem(title: "helo", isMe: true),
      growable: true);

  void sendMessage(String message) {
    if (socket.connected) {
      messLst.add(MessageItem(title: message, isMe: true));
      // Gửi tin nhắn lên server với sự kiện 'clientMessage'
      socket.emit('clientMessage', {
        'content': message,
        'senderID': us.phoneNumber,
        'to': conv.idUs1 == us.phoneNumber ? conv.idUs2 : conv.idUs1,
        'timestamp': DateTime.now().toString(),
        'conversationID': conv.id,
      });

      // ignore: avoid_print
      print('Sent message to server: $message');
      setState(() {});
    } else {
      // ignore: avoid_print
      print('Socket is not connected');
    }
  }

  void sendUserId() {
    // Gửi sự kiện 'userConnected' để thông báo ID người dùng khi kết nối
    socket.emit('userConnected', {'userId': us.phoneNumber, 'admin': us.admin});
    // ignore: avoid_print
    print('Sent user ID to server: ${us.phoneNumber}');
  }

  void receiveMessages(mess, fromTo) {
    messLst.add(MessageItem(title: mess, isMe: fromTo == us.phoneNumber));
    // Scroll to the bottom of the chat
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );

    // ignore: avoid_print
    print(fromTo == us.phoneNumber);
  }

  Future<void> loadData() async {
    UserPresenter usPre = UserPresenter(this);
    us = await usPre.getUserByID(widget.phoneNumber);
    ConversationPresenter convPre = ConversationPresenter();
    if (us.admin) {
      conv = await convPre.getConv(widget.us1);
    } else {
      conv = await convPre.getConv(us.phoneNumber);
    }

    MessagePresenter messPre = MessagePresenter();
    List<Message> messData = List.filled(
        0,
        Message(
            id: 0,
            senderID: 'senderID',
            content: 'content',
            timestamp: DateTime.now(),
            conversationId: 0,
            status: 0));
    messData = await messPre.getMessLstByConvId(conv.id);
    messLst.clear();
    for (var item in messData) {
      messLst.add(MessageItem(
          title: item.content, isMe: item.senderID == us.phoneNumber));
    }
    // ignore: avoid_print
    print('chat id conv:${conv.id}');
    setState(() {
      // ignore: avoid_print
      print('chat id us:${us.phoneNumber}');
    });
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
    socket = io.io(host, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    // Kiểm tra trạng thái kết nối
    socket.on('connect', (_) {
      // ignore: avoid_print
      print('Connected');
      sendUserId();
    });

    // Đăng ký sự kiện 'chat message'
    socket.on('servertMessage', (data) {
      // ignore: avoid_print
      print('Nhận được tin nhắn: $data');
      loadData();
      //receiveMessages(data['mess'], data['from']);
    });

    socket.onDisconnect((_) {
      setState(() {
        // ignore: avoid_print
        print("disconnected");
      });
    });

    loadData();
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
        child: Column(children: [
          SizedBox(
            height: hS * 0.75,
            child: SingleChildScrollView(
              reverse: true,
              controller: _scrollController,
              child: Column(children: messLst),
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
    socket.disconnect();
    socket.dispose();
    super.dispose();
  }

  @override
  void displayMessage(String message) {}
}