
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
      : id = json['id']??0,
      Status=json['Status']??0,
      paymentMethods=json['paymentMethods']??0,
      phoneNumber=json['phoneNumber']??"",
      date=DateTime.parse(json['date'])??DateTime.now(),
      transportFee=json['transportFee']??"";
}
