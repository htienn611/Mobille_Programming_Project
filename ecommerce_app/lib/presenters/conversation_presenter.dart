import 'package:ecommerce_app/data_source/repository/get_table.dart';
import 'package:ecommerce_app/models/conversation.dart';

class ConversationPresenter {
  Future<List<Conversation>> getCateLst() async {
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
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }
}
