import 'dart:ffi';

class User{
  final String phoneNumber;
  final String name;
  final String sex;
  final String birthday;
  final String address;
  final String password;
  final String status;

  User({required this.phoneNumber,required this.name,required this.sex,required this.birthday,required this.address,required this.password,required this.status});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      address: json['address']??"",
      birthday: json['birthday']??"",
      name: json['name']??"",
      password: json['password']??"",
      phoneNumber: json['phoneNumber']??"",
      sex: json['sex']??"",
      status: json['status']??"",
      );
  }
}