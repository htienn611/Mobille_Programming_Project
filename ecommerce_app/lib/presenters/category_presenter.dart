import '../data_source/repository/data.dart';
import '../models/category.dart';

class CategoryPresenter {
  Future<List<Category>> getCateLst() async {
    List<Category> rsLst =
        List.filled(0, Category(id: 0, nameCate: "", status: 0), growable: true);

    try {
      List<dynamic> value = await getTable("category");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Category.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rsLst;
  }
}
