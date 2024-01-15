
class Order {
  int id;
  int Status;
  int paymentMethods;
  String phoneNumber;
  DateTime date;
  int transportFee;
  Order( this.id, this.Status, this.paymentMethods, this.phoneNumber, this.date,
      this.transportFee);

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'],
      Status=json['Status'],
      paymentMethods=json['paymentMethods'],
      phoneNumber=json['phoneNumber'],
      date=DateTime.parse(json['date']),
      transportFee=json['transportFee'];
}
