import 'package:ecommerce_app/models/conversation.dart';

import '../data_source/repository/data.dart';

class ConversationPresenter {
  Future<List<Conversation>> getConvLst() async {
    List<Conversation> rsLst = List.filled(
        0, Conversation(id: 0, idUs1: "idUs1", idUs2: "idUs2", status: 0),
        growable: true);

    try {
      List<dynamic> value = await getTable("conversation");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Conversation.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching conversation data: $error');
    }
    return rsLst;
  }

  Future<Conversation> getConv(idUs1) async {
    List<Conversation> rsLst = List.filled(
        0, Conversation(id: 0, idUs1: "idUs1", idUs2: "idUs2", status: 0),
        growable: true);

    try {
      List<dynamic> value =
          await getItemByTitle("conversation", "idUs1", idUs1);

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Conversation.fromJson(json)).toList();
      } else {
        await insertConversation(
            Conversation(id: 0, idUs1: idUs1, idUs2: '0949866367', status: 0));
        List<dynamic> value1 =
            await getItemByTitle("conversation", "idUs1", idUs1);
        rsLst.clear();
        rsLst = value1.map((json) => Conversation.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching conversation data: $error');
    }
    return rsLst[0];
  }

  Future<void> insertConversation(Conversation conv) async {
    try {
      List<dynamic> value = await insertConv(conv);
      // ignore: avoid_print
      print('convPre:${value[0]['success']}');
      // ignore: avoid_print
    } catch (error) {
      // ignore: avoid_print
      print('Error Insert conversation data: $error');
    }
  }
}
