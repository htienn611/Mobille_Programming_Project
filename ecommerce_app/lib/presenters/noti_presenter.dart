import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:flutter/material.dart';

import '../models/notification.dart';

class Notification_Presenter {
  Future<Notification?> InsertNoti(
      {required String phoneNumber, required String content}) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/notification'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'phoneNumber': phoneNumber, 'content': content}),
    );
  }
  Future<List<Notifications>> getNotiByPhoneNumber(String phoneNumber) async {
  List<Notifications> notisByPhoneNumber = [];

  try {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}/notification/$phoneNumber'),
    );

    if (response.statusCode == 200) {
      // Parse the response body
      final List<dynamic> data = json.decode(response.body);

      // Map each notification data to a Notification object
      notisByPhoneNumber = data.map((json) => Notifications.fromJson(json)).toList();
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching data: $error');
  }

  return notisByPhoneNumber;
}



}
