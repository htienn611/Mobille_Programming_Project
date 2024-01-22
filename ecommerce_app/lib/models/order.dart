
class Order {
  int id;
  int Status;
  int paymentMethods;
  String phoneNumber;
  DateTime date;
  int transportFee;
  String address;
  
  Order( this.id, this.Status, this.paymentMethods, this.phoneNumber, this.date,
      this.transportFee,this.address);

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id']??0,
      Status=json['Status']??0,
      paymentMethods=json['paymentMethods']??0,
      phoneNumber=json['phoneNumber']??"",
      date=DateTime.parse(json['date'])??DateTime.now(),
      transportFee=json['transportFee']??"",
      address=json['address']??"";
}
