import 'dart:ffi';

class Notification{
  final String phoneNumber;
  final String content;
  final int id;

  Notification({required this.phoneNumber,required this.content,required this.id});

  factory Notification.fromJson(Map<String,dynamic> json){
    return Notification(
      content: json['content']??"",
      phoneNumber: json['phoneNumber']??"",
      id: json['id']??"",
      );
  }
}