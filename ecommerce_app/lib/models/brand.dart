import 'package:ecommerce_app/models/procces/get_table.dart';


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
      : id = json['id']??0,
        name = json['name']??"",
        idCat = json['idCat']??0,
        status = json['status']??0;

}
