import 'package:ecommerce_app/models/procces/get_table.dart';
import 'package:ecommerce_app/models/product.dart';
class ProductPresenter{
    Future<List<Product>> getProductLst() async {
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
      List<dynamic> value = await getTable('product');
      if (value.isNotEmpty) {
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây 
      print('Error fetching data: $error (PRODUCT)');
    }
    print(rsLst);
    return rsLst;
  }
}