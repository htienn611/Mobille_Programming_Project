class Brand {
  final int id;
  final String name;
  final int status;

  Brand({
    required this.id,
    required this.name,
    required this.status,
  });

  Brand.fromJson(Map<String, dynamic> json)
      : id = json['id']??0,
        name = json['name']??"",
        status = json['status']??0;

}
