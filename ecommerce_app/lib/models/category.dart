class Category {
  final int id;
  final String nameCate;
  final int status;
  Category({required this.id, required this.nameCate, required this.status});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nameCate = json['nameCate'],
        status = json['status'];
}
