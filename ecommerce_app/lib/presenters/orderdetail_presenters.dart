import 'package:ecommerce_app/data_source/repository/get_data.dart';
import 'package:ecommerce_app/models/order_detail.dart';

class OrderDetailPresenter{
  Future<List<OrderDetail>> getlstOrderDetail() async {
    List<OrderDetail> rsLst =
        List.filled(0,OrderDetail(0, 0, 0) , growable: true);

    try {
      List<dynamic> value = await getTable("order_details");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => OrderDetail.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
   // print(rsLst);
    return rsLst;
    }
  
}