import 'package:ecommerce_app/models/brand.dart';

import '../data_source/repository/data.dart';

class BrandPresenter{
   Future<List<Brand>> getBrandLst() async {
    List<Brand> rsLst = List.filled(
        0, Brand(id: 0, name: "", status: true),
        growable: true);

    try {
      List<dynamic> value = await getTable("brand");

      if (value.isNotEmpty) {
        rsLst = value.map((json) => Brand.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error (BRAND)');
    }
    return rsLst;
  }
   Future<List<Brand>> getBrandLstByCate(idCate) async {
    List<Brand> rsLst = List.filled(
        0, Brand(id: 0, name: "", status: true),
        growable: true);

    try {
      List<dynamic> value = await getItemByTitle("brand","byCate", idCate);

      if (value.isNotEmpty) {
        rsLst = value.map((json) => Brand.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      // ignore: avoid_print
      print('Error fetching data: $error (BRAND)');
    }
    return rsLst;
  }
}