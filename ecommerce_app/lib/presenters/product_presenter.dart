import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';

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
      dynamic value = await addProduct(p, "product");

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

  Future<List<Product>> getBestSellingProducts(var limit,var idCate ) async {
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
      OrderDetailPresenter orderDetailsPre = OrderDetailPresenter();
      List<dynamic> idLst =
          await orderDetailsPre.getBestSellingProductId(limit,idCate);
      String strIds = "";
      if (idLst.isNotEmpty) {
        for (var item in idLst) {
          if (item != idLst.last) {
            strIds += '${item.toString()},';
          } else {
            strIds += item.toString();
          }
        }
      }
      print(strIds);
      List<dynamic> value =
          await getItemByTitle("product", "best_selling", strIds);

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
}
