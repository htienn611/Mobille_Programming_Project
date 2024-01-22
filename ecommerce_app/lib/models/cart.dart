
class Cart {
  String phoneNumber;
  int id;
  int status;
  
  Cart(this.phoneNumber, this.id, this.status);

  Cart.fromJson(Map<String, dynamic> json)
      : phoneNumber=json['phoneNumber'],
      id = json['id'],
      status=json['status'];
}
