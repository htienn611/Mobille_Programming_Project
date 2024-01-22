import 'package:ecommerce_app/models/messages.dart';
import '../data_source/repository/data.dart';

class MessagePresenter {
  Future<List<Message>> getMessLst() async {
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
      List<dynamic> value = await getTable("messages");

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

  Future<List<Message>> getMessLstByConvId(convId) async {
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
      List<dynamic> value = await getItemByTitle("messages","conversationID", convId);
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

  Future<void> insertConversation(Message mess) async {
    try {
      List<dynamic> value = await insertMess(mess);
      // ignore: avoid_print
      print('convPre:${value[0]['success']}');
      // ignore: avoid_print
    } catch (error) {
      // ignore: avoid_print
      print('Error Insert conversation data: $error');
    }
  }
}
