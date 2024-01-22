import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/models/cart.dart';

class CartPresenter {
  //trả về một future chứa danh sách các đối tượng cart
  Future<Cart> getCartPhoneNumber(String phoneNumber) async {
    Cart rs = Cart('',0, 0);

      try {
      dynamic value = await getCartByPhoneNumber("cart", phoneNumber);

      if (value.isNotEmpty) {
        rs = Cart.fromJson(value[0]);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }
}
