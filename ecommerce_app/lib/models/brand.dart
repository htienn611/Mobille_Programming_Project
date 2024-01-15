

import '../data_source/repository/get_data.dart';

class Brand {
  final int id;
  final String name;
  final int idCat;
  final int status;

  Brand({
    required this.id,
    required this.name,
    required this.idCat,
    required this.status,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['_name'],
        idCat = json['idCat'],
        status = json['status'];

  static Future<List<Brand>> getBrandLst() async {
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
      print('Error fetching data: $error');
    }
    print(rsLst);
    return rsLst;
  }
}
