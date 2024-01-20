class Brand {
  final int id;
  final String name;
  final int idCate;
  final int status;

  Brand({
    required this.id,
    required this.name,
    required this.idCate,
    required this.status,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id']??0,
        name = json['name']??"",
        idCate = json['idCate']??0,
        status = json['status']??0;

}
