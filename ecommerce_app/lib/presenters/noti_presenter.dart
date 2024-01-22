

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:flutter/material.dart';

class Notification_Presenter
{
  Future<Notification?> InsertNoti({ required String phoneNumber, required String content}) async {

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/notification'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'phoneNumber': phoneNumber,
        'content':content
      }),
      
    );
}
}