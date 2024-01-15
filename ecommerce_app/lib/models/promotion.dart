class Promotion {
  final int id;
  final String title;
  final String des;
  final DateTime startDate;
  final DateTime endDate;
  final int status;
  final int quantityForEach;

  Promotion(
      {required this.id,
      required this.title,
      required this.des,
      required this.startDate,
      required this.endDate,
      required this.quantityForEach,
      required this.status});

  Promotion.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        des = json['description'],
        startDate = DateTime.parse(json['startDate']),
        endDate = DateTime.parse(json['endDate']),
        quantityForEach = json['quantityForEach'],
        status = json['status'];
}
