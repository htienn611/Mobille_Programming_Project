import 'package:ecommerce_app/models/promotion.dart';

import '../data_source/repository/data.dart';

class PromotionPresenter{
  Future<List<Promotion>> getPromotionLst() async {
    List<Promotion> rsLst = List.filled(
        0,
        Promotion(id: 0, title: "title", des: "des", startDate: DateTime.now(), endDate: DateTime.now(), quantityForEach: 0, status: 0),
        growable: true);

    try {
      List<dynamic> value = await getTable("promotion");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Promotion.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error (PROMOTION)');
    }
    // print(rsLst);
    return rsLst;
  }
}