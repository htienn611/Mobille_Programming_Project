 import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/procces/get_table.dart';
class CategoryPresenter {
  Future<List<Category>> getCateLst() async {
    List<Category> rsLst =
        List.filled(0, Category(id: 0, nameCate: ""), growable: true);

    try {
      List<dynamic> value = await getTable("category");

      if (value.isNotEmpty) {
        rsLst = value.map((json) => Category.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error (CATEGORY)');
    }
    //print(rsLst);
    return rsLst;
  }
}
