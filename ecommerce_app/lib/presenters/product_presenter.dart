import 'dart:convert';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:http/http.dart' as http;
import '../data_source/repository/data.dart';

class ProductPresenter {
  Future<List<Product>> getProduct() async {
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
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }

  Future<bool> addProductPresenter(Product p) async {
    try {
      final response = await http.post(
        Uri.parse('$host/product'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'image': p.image,
          'name': p.name,
          'quantity': p.quantity,
          'price': p.price,
          'des': p.des,
          'idDiscount': p.idDiscount,
          'status': p.status,
          'idCate': p.idCate,
          'idBrand': p.idBrand
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

  Future<bool> updateProductPresenter(Product p) async {
    try {
      final response = await http.put(
        Uri.parse('$host/product/${p.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'image': p.image,
          'name': p.name,
          'quantity': p.quantity,
          'price': p.price,
          'des': p.des,
          'idDiscount': p.idDiscount,
          'status': p.status,
          'idCate': p.idCate,
          'idBrand': p.idBrand
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error updating product: $error (PRODUCT_PRESENTER)');
    }
    return false;
  }

  Future<bool> deleteProductPresenter(Product p) async {
    try {
      final response = await http.put(
        Uri.parse('$host/product/${p.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'image': p.image,
          'name': p.name,
          'quantity': p.quantity,
          'price': p.price,
          'des': p.des,
          'idDiscount': p.idDiscount,
          'idCate': p.idCate,
          'idBrand': p.idBrand
        }),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error updating product: $error (PRODUCT_PRESENTER)');
    }
    return false;
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
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rs;
  }

  Future<List<Product>> getBestSellingProducts(var limit, var idCate) async {
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
          await orderDetailsPre.getBestSellingProductId(limit, idCate);
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
      // ignore: avoid_print
      print('Ids Product: $strIds');
      List<dynamic> value = await getItemByTitle("product", "byIdLst", strIds);
      // ignore: avoid_print
      print("loaded: getBestSellingProducts product presenter");
      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }

  Future<List<Product>> getProductsByIdCateIdBrand(
      limit, idCate, idBrand) async {
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
      List<dynamic> value =
          await getItemByTitle("product", "byIdCate", idCate, [idBrand, limit]);
      // ignore: avoid_print
      print("loaded: getProductsByIdCateIdBrand product presenter");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rsLst;
  }

  Future<List<Product>> getInfoProductByIdOrderDetail(int id) async {
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
      List<dynamic> value = await getItemByTitle("product", "InfoProduct", id);
      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => Product.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
    return rsLst;
  }

  Future<Product> getOneProduct(id) async {
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
      List<dynamic> value = await getItemByTitle("product", "OneProduct", id);
      // ignore: avoid_print
      print("loaded: getProductsByIdCateIdBrand product presenter");

      if (value.isNotEmpty) {
        rs = Product.fromJson(value[0]);
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    return rs;
  }
}
