import 'dart:convert';

import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/models/cart_detail.dart';
import 'package:http/http.dart' as http;

class CartDetailPresenter {
  Future<List<CartDetail>> getlstCartDetail() async {
    List<CartDetail> rsLst =
        List.filled(0, CartDetail(0, 0, 0), growable: true);

    try {
      List<dynamic> value = await getTable("cart_details");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => CartDetail.fromJson(json)).toList();
      }
    } catch (error) { 
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rsLst;
  }

  Future<CartDetail> getCartDetailByID(int id) async {
    CartDetail rs = CartDetail(0 ,0, 0);

    try {
      dynamic value = await getItemByID("cart_details", id);

      if (value.isNotEmpty) {
        rs = CartDetail.fromJson(value[0]);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }
  Future<bool> addCartDetailPresenter(CartDetail c) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.16:3000/cart_details'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          //'idCart': c.idCart,
          'idProduct': c.idProduct,
          'quantity': c.quantity,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error (PRODUCT_PRESENTER)');
    }
    return false;
  }

  Future<bool> updateCartDetailPresenter(CartDetail c) async {
    try {
      final response = await http.put(
        Uri.parse('http://192.168.1.16:3000/cart_details/${c.idCart}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'idProduct': c.idProduct,
          'quantity': c.quantity,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error updating product: $error (PRODUCT_PRESENTER)');
    }
    return false;
  }

Future<void> deleteCart(int idCart) async {
    try {
      final response = await http.delete(
        Uri.parse('http://172.16.12.38:3000/cart_details/$idCart'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        print('Cart deleted successfully');
      } else {
        print('Failed to delete cart. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error deleting cart: $error');
    }
  }
}