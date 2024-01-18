import 'dart:convert';
import 'dart:ffi';

import 'package:ecommerce_app/data_source/repository/get_data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:http/http.dart' as http;

class ProductPresenter {
  Future<List<Product>> getProduct() async {
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
      List<dynamic> value = await getTable("product");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }

  Future<bool> addProductPresenter(Product p) async {
    try {
      // bool value = await addProduct(p, "product");
final response = await http.post(
      Uri.parse('http://192.168.142.104:3000/product'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'image':p.image,
            'name':p.name,
            'quantity': p.quantity,
            'price':p.price,
            'des':p.des,
            'idDiscount': p.idDiscount,
            'status':p.status,
            'idCate':p.idCate,
            'idBrand':p.idBrand
      }),
    );
      if (response.statusCode==200) {
        return true;
      }
    } catch (error) {
      print('Error fetching data: $error (PRODUCT_PRESENTER)');
    }
    return false;
  }

  Future<Product> getProductByID(int id) async {
    Product rs = Product(
        id: 0,
        image: "",
        name: "",
        quantity: 0,
        price: 0,
        des: "",
        idDiscount: 0,
        status: 0,
        idCate: 0,
        idBrand: 0);

    try {
      dynamic value = await getItemByID("product", id);

      if (value.isNotEmpty) {
        rs = Product.fromJson(value[0]);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }
}
