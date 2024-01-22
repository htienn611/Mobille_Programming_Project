
class Product {
  late int id;
  final String image;
  final String name;
  final int quantity;
  final int price;
  final String des;
  late  int idDiscount;
  final int status;
  late int idCate;
  late int idBrand;


  Product(
      {required this.id,
      required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.des,
      required this.idDiscount,
      required this.status,
      required this.idCate,
      required this.idBrand});
  Product.AddProduct(
      {required this.image,
      required this.name,
      required this.quantity,
      required this.price,
      required this.des,
      required this.idDiscount,
      required this.status,
      required this.idCate,
      required this.idBrand});

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        image = json['image'] ?? "",
        name = json['name'] ?? "",
        quantity = json['quantity'] ?? 0,
        price = json['price'] ?? 0,
        des = json['des'] ?? "",
        idDiscount = json['idDiscount'] ?? 0,
        status = json['status'] ?? 0,
        idCate = json['idCate'] ?? 0,
        idBrand = json['idBrand'] ?? 0;
}


