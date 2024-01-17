
class Category {
  final int id;
  final String nameCate;
  Category({required this.id, required this.nameCate});

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nameCate = json['nameCate'];

  }

