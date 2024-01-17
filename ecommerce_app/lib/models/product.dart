
import 'package:ecommerce_app/models/procces/get_table.dart';

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
      : id = json['id'],
        image = json['image'],
        name = json['name'],
        quantity = json['quantity'],
        price = json['price'],
        des = json['des'],
        idDiscount = json['idDiscount'],
        status = json['status'],
        idCate = json['idCate'],
        idBrand = json['idBrand'];


}
