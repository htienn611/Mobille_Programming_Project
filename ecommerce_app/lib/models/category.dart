import 'dart:convert';

import 'package:ecommerce_app/data_source/api/get_table.dart';

class Category {
  final int id;
  final String nameCate;
  Category({required this.id, required this.nameCate});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nameCate = json['nameCate'];

  static Future<List<Category>> getCateLst() async {
    List<Category> rsLst =
        List.filled(0, Category(id: 0, nameCate: ""), growable: true);

    try {
      List<dynamic> value = await getTable("category");

      if (value.isNotEmpty) {
        rsLst = value.map((json) => Category.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error');
    }
    print(rsLst);
    return rsLst;
  }
}
