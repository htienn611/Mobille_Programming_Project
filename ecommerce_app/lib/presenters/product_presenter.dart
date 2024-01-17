import 'package:ecommerce_app/data_source/repository/get_data.dart';
import 'package:ecommerce_app/models/product.dart';

class ProductPresenter {
  Future<List<Product>> getlstProduct() async {
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
  Future<Product> addProductPre(Product p) async {
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
      dynamic value = await addProduct(p,"product");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return p;
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
