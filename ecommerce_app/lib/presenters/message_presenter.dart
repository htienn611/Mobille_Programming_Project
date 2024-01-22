import 'package:ecommerce_app/models/messages.dart';
import '../data_source/repository/data.dart';

class MessagePresenter {
  Future<List<Message>> getCateLst() async {
    List<Message> rsLst = List.filled(
        0,
        Message(
            id: 0,
            senderID: "senderID",
            content: "content",
            timestamp: DateTime.now(),
            conversationId: 0,
            status: 0),
        growable: true);

    try {
      List<dynamic> value = await getTable("message");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Message.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rsLst;
  }
}
