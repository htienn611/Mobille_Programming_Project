import 'package:ecommerce_app/models/brand.dart';

import '../data_source/repository/data.dart';

class BrandPresenter{
  
   Future<List<Brand>> getBrandLst() async {
    List<Brand> rsLst = List.filled(
        0, Brand(id: 0, name: "", idCat: 0, status: 0),
        growable: true);

    try {
      List<dynamic> value = await getTable("brand");

      if (value.isNotEmpty) {
        rsLst = value.map((json) => Brand.fromJson(json)).toList();
      }
    } catch (error) {
      // Xử lý lỗi ở đây nếu cần thiết
      print('Error fetching data: $error (BRAND)');
    }
    return rsLst;
  }
}