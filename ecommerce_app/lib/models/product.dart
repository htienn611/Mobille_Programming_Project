import 'dart:convert';

import 'package:ecommerce_app/data_source/api/get_table.dart';

class Product {
  final int id;
  final String image;
  final String name;
  final int quantity;
  final int price;
  final String des;
  final int idDiscount;
  final int status;
  final int idCate;
  final int idBrand;

  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.des,
      required this.idDiscount,
      required this.status,
      required this.idCate,
      required this.idBrand});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        image = json['image'],
        name = json['_name'],
        quantity = json['quantity'],
        price = json['price'],
        des = json['des'],
        idDiscount = json['idDiscount'],
        status = json['status'],
        idCate = json['idCate'],
        idBrand = json['idBrand'];

  static Future<List<Product>> getProductLst() async {
    List<Product> rsLst = List.filled(
        0,
        Product(
            id: 0,
            image: "",
            name: "",
            quantity: 0,
            price: 0,
            des: "",
            idDiscount: 0,
            status: 0,
            idCate: 0,
            idBrand: 0),
        growable: true);

    try {
      List<dynamic> value = await getTable('product');
      if (value.isNotEmpty) {
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error (PRODUCT)');
    }
    print(rsLst);
    return rsLst;
  }
}
