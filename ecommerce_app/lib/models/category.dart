import 'package:ecommerce_app/data_source/repository/get_table.dart';

class Category {
  final int id;
  final String nameCate;
  Category({required this.id, required this.nameCate});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        nameCate = json['nameCate'];

  
}
