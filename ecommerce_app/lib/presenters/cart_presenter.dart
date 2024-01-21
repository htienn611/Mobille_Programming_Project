import 'package:ecommerce_app/models/cart.dart';
import '../data_source/repository/get_data.dart';

class CartPresenter {
  //trả về một future chứa danh sách các đối tượng cart
  Future<List<Cart>> getlstOrder() async {
    List<Cart> rsLst =
        List.filled(0, Cart("", 0, 0), growable: true);

    try {
      List<dynamic> value = await getTable("cart");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Cart.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return rsLst;
  }
}
