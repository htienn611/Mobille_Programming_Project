import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class ApiConstants {
  static const String baseUrl = 'https://b309-58-187-136-7.ngrok-free.app';
}

abstract class UserView {
  void displayMessage(String message);
}

class UserPresenter {
  final UserView _view;

  UserPresenter(this._view);

  Future<void> Login(String phoneNumber, String password) async {
    final hashedPassword = _hashPassword(password);

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/login'),
      body: {
        'phoneNumber': phoneNumber,
        'password': hashedPassword,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final User user = User.fromJson(responseData);
      _view.displayMessage('Login successful, welcome ${user.name}!');
    } else if (response.statusCode == 401) {
      _view.displayMessage('Invalid phoneNumber or password');
    } else {
      _view.displayMessage('Failed to login. Please try again.');
    }
  }

  Future<void> Register({
    required String birthday,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    final hashedPassword = _hashPassword(password);
    
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/user'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'birthday': birthday,
        'password': hashedPassword,
        'name': name,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final User user = User.fromJson(responseData);
      _view.displayMessage('Registration successful, welcome ${user.name}!');
    } else if (response.statusCode == 400) {
      _view.displayMessage('phoneNumber is already registered');
    } else {
      _view.displayMessage('Failed to register. Please try again.');
    }
  }

  String _hashPassword(String password) {
    final keyBytes = utf8.encode(password);
    final digest = sha256.convert(keyBytes);
    return digest.toString();
  }
}

