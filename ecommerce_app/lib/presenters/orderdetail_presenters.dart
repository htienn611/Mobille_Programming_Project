import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';

class OrderDetailPresenter {
  Future<List<OrderDetail>> getlstOrderDetail() async {
    List<OrderDetail> rsLst =
        List.filled(0, OrderDetail(0, 0, 0), growable: true);

    try {
      List<dynamic> value = await getTable("order_details");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => OrderDetail.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rsLst;
  }

  Future<List<String>> getBestSellingProductId(
      int limit, dynamic idCate) async {
    List<String> rsLst = List.filled(0, "", growable: true);

    try {
      List<dynamic> value = await getItemByTitle(
          "order_details", "best_selling", limit, [idCate]);
      // ignore: avoid_print
      print("loaded: getBestSellingProductId in order detail presenter");
      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((e) => e['id'].toString()).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }

   Future<OrderDetail> getOrderDetailByID(int id) async {
    OrderDetail rs=OrderDetail(0,0, 0);

    try {
      dynamic value = await getItemByID("order_details", id);

      if (value.isNotEmpty) {
        rs = OrderDetail.fromJson(value[0]);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }
//Lấy list orderDetailByID
     Future<List<OrderDetail>> getListOrderDetailByID(int id) async {
     List<OrderDetail>rs=List.filled(0,  OrderDetail(0, 0, 0),growable: true);

    try {
     List< dynamic> value = await getItemByID("order_details", id);

      if (value.isNotEmpty) {
        rs.clear();
        rs = value.map((json) => OrderDetail.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }

  
}
