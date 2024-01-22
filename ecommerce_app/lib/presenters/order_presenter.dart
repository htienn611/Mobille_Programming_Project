import 'package:ecommerce_app/models/order.dart';
import '../data_source/repository/data.dart';

class OrderPresenter {
  //trả về một future chứa danh sách các đối tượng order
  Future<List<Order>> getlstOrder() async {
    List<Order> rsLst =
        List.filled(0, Order(0, 0, 0, "", DateTime.now(), 0), growable: true);

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
    Order rs=Order(0, 0, 0, "",DateTime.now(), 0);

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

  
}
