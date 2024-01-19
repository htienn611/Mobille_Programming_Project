import 'dart:convert';
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

var host = 'http://192.168.1.4:3000';

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('$host/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> getItemByID(String tableName, int id) async {
  final response = await http.get(Uri.parse('$host/$tableName/id$id'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> getItemByTitle(String tableName, String title,
    [dynamic val, List<dynamic>? paras]) async {
  String url = '$host/$tableName/$title$val';
  print(url);
  if (paras != null) {
    for (var item in paras) {
      url += '/$item';
    }
  }

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<dynamic> addProduct(Product product, String tableName) async {
  final Uri url = Uri.parse(('$host/$tableName'));

  try {
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'image': product.image,
        'name': product.name,
        'quantity': product.quantity,
        'price': product.price,
        'des': product.des,
        'idDiscount': product.idDiscount,
        'status': product.status,
        'idCate': product.idCate,
        'idBrand': product.idBrand,
      }),
    );
  } catch (error) {
    // xử lý lỗi
  }
}
