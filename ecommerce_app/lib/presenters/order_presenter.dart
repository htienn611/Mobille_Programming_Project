import 'dart:convert';

import 'package:ecommerce_app/models/order.dart';
import '../data_source/repository/data.dart';
import 'package:http/http.dart' as http;


class OrderPresenter {

  //trả về một future chứa danh sách các đối tượng order
  Future<List<Order>> getlstOrder() async {
    List<Order> rsLst =
        List.filled(0, Order(0, 0, 0, "", DateTime.now(), 0,""), growable: true);

    try {
      List<dynamic> value = await getTable("order");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Order.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }
  
   Future<Order> getOrderByID(int id) async {
    Order rs=Order(0, 0, 0, "",DateTime.now(), 0,"");

    try {
      dynamic value = await getItemByID("order", id);

      if (value.isNotEmpty) {
        rs = Order.fromJson(value[0]);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }

  //update tt hủy đơn

  Future<bool> updateStatusOrder(Order p) async {
    try {
      final response = await http.put(
        Uri.parse('$host/order/id/${p.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
         'paymentMethods':p.paymentMethods,
        'phoneNumber': p.phoneNumber,
          'date': p.date.toIso8601String(),
          'transportFee': p.transportFee,
          'address': p.address,
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      print('Error updating order: $error (order_presenter)');
    }
    return false;
  }

  

Future<bool> addOrderPresenter(Order o) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.2.3:3000/order'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'paymentMethods': o.paymentMethods,
          'phoneNumber': o.phoneNumber,
          'date': o.date,
          'transportFee': o.transportFee,
          'Status': o.Status,
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
  
}
