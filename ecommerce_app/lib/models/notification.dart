import 'dart:ffi';

class Notifications{
  final String phoneNumber;
  final String content;
  final String id;

  Notifications({required this.phoneNumber,required this.content,required this.id});

  factory Notifications.fromJson(Map<String,dynamic> json){
    return Notifications(
      content: json['content']??"",
      phoneNumber: json['phoneNumber']??"",
      id: json['id']??"",
      );
  }
}