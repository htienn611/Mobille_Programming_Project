import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/procces/get_table.dart';

class OrderPresenter{
   Future<List<Order>> getlstOrder() async {
    List<Order> rsLst =
        List.filled(0,Order(0, 0, 0, "", DateTime.now(), 0) , growable: true);

    try {
      List<dynamic> value = await getTable("order");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Order.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    print(rsLst);
    return rsLst;
    }
  

}