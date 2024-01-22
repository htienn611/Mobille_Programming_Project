import 'dart:convert';
import 'package:ecommerce_app/models/conversation.dart';
import 'package:ecommerce_app/models/messages.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

var host = 'http://172.16.12.117:3000';

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('$host/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> getTableByIdCate(String tableName, {int? idCate}) async {
  final url =
      idCate != null ? '$host/$tableName?idCate=$idCate' : '$host/$tableName';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> getItemByID(String tableName, id) async {
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
  if (paras != null) {
    for (var item in paras) {
      url += '/$item';
    }
  }
  // ignore: avoid_print
  print(url);

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

// ADD SẢN PHẨM
Future<dynamic> addProduct(Product product, String tableName) async {
  final Uri url = Uri.parse(('$host/$tableName'));

  try {
    //final response =
    await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({
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

// UPDATE SẢN PHẨM THEO ID
Future<dynamic> updateProduct(Product product, String tableName) async {
  final Uri url = Uri.parse('$host/$tableName/${product.id}');
  try {
    final response = await http.put(
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
        'idCate': product.idCate,
        'idBrand': product.idBrand,
      }),
    );

    // Cập nhật thành công
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    // Có lỗi trong quá trình cập nhật
    else {
      throw Exception('Failed to update product (data.dart)');
    }
  } catch (error) {
    // ignore: avoid_print
    print('Error updating product: $error  (data.dart)');
    throw Exception('Error updating product: $error (data.dart)');
  }
}

Future<dynamic> insertConv(Conversation val) async {
  String url = '$host/conversation/insert';
  // ignore: avoid_print
  print(url);

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'idUs1': val.idUs1,
      'idUs2': val.idUs2,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<dynamic> insertMess(Message val) async {
  String url = '$host/messages/insert';
  // ignore: avoid_print
  print(url);

  final response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      'senderID': val.senderID,
      'content': val.content,
      'timestamp': val.timestamp,
      'conversationID': val.conversationId
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
