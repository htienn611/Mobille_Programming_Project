import 'dart:convert';
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

var host = 'http://172.16.12.99:3000';

Future<List<dynamic>> getTable(String tableName) async {
  final response = await http.get(Uri.parse('$host/$tableName'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
Future<List<dynamic>> getTableByIdCate(String tableName, {int? idCate}) async {
  final url = idCate != null ? '$host/$tableName?idCate=$idCate' : '$host/$tableName';
  final response = await http.get(Uri.parse(url));

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

Future<List<dynamic>> getItemByPhone(String tableName, String phone) async {
  final response = await http.get(Uri.parse('$host/$tableName/phoneNumber/$phone'));
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

//update hóa đơn theo id
Future<dynamic> updateOrder(Order order, String tableName) async {
  final Uri url = Uri.parse('$host/$tableName/${order.id}');
  try {
    final response = await http.put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'paymentMethods': order.paymentMethods,
        'phoneNumber': order.phoneNumber,
        'date': order.date?.toIso8601String(), // Thêm kiểm tra null cho order.date
        'transportFee': order.transportFee,
        'address': order.address,
      }),
    );

    // Cập nhật thành công
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    // Có lỗi trong quá trình cập nhật
    else {
      print('Failed to update order: ${response.body}');
      throw Exception('Failed to update order (data.dart)');
    }
  } catch (error) {
    print('Error updating order: $error');
    throw Exception('Error updating order: $error (data.dart)');
  }
}



