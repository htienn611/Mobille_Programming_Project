import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:ecommerce_app/data_source/repository/data.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class ApiConstants {
  static String baseUrl = host;
}

abstract class UserView {
  void displayMessage(String message);
}

class UserPresenter {
  final UserView _view;
  bool loginSuccessful = false;

  UserPresenter(this._view);

  Future<User?> Login(
      {required String phoneNumber, required String password}) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/user/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      loginSuccessful = true;
      _view.displayMessage('Login successful!');
      await saveLoginStatus(true, phoneNumber);
    } else if (response.statusCode == 401) {
      loginSuccessful = false;
      _view.displayMessage('Invalid phoneNumber or password');
    } else {
      loginSuccessful = false;
      _view.displayMessage('Failed to login. Please try again.');
    }
    return null;
  }

  Future<void> Register({
    required String birthday,
    required String password,
    required String name,
    required String phoneNumber,
  }) async {
    final hashedPassword = _hashPassword(password);

    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}/user/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'birthday': birthday,
        'password': hashedPassword,
        'name': name,
        'phoneNumber': phoneNumber,
      }),
    );

    if (response.statusCode == 200) {
      _view.displayMessage('Registration successful!');
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

  Future<User?> getUserByPhoneNumber(String phoneNumber) async {
    User? userByPhoneNumber;

    try {
      final response = await http.get(
        Uri.parse('${ApiConstants.baseUrl}/user/'),
      );
      // print('API Response Body: ${response.body}');
      if (response.statusCode == 200) {
        // Parse the response body
        final List<dynamic> data = json.decode(response.body);
        // Find user with specific phone number
        var matchingUser = data.firstWhere(
          (json) => User.fromJson(json).phoneNumber == phoneNumber,
          orElse: () => null,
        );

        if (matchingUser != null) {
          userByPhoneNumber = User.fromJson(matchingUser);
        }
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }

    return userByPhoneNumber;
  }

  Future<bool> updateUser({
    required String phoneNumber,
    required String name,
    required bool sex,
    required String birthday,
    required String biography,
  }) async {
    try {
      // Make a request to your update API endpoint
      final response = await http.post(
        Uri.parse('${ApiConstants.baseUrl}/user/update'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'phoneNumber': phoneNumber,
          'name': name,
          'sex': sex,
          'birthday': birthday,
          'biography': biography,
          // Add other necessary fields
        }),
      );

      if (response.statusCode == 200) {
        _view.displayMessage('User updated successfully');

        return true; // Update successful
      } else {
        print('Error updating user: ${response.statusCode}');
        _view.displayMessage('Failed to update user. Please try again.');
        return false; // Update failed
      }
    } catch (error) {
      print('Error updating user: $error');
      _view.displayMessage('Failed to update user. Please try again.');
      return false; // Update failed
    }
  }

  Future<void> saveLoginStatus(bool isLoggedIn, String phoneNumber) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', isLoggedIn);
    prefs.setString('phoneNumber', phoneNumber);
  }

  Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<String> getSavedPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('phoneNumber') ?? '';
  }

  Future<void> clearSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  ////////////tienn

  Future<User> getUserByID(id) async {
    var rs = User(
        phoneNumber: 'phoneNumber',
        name: 'name',
        sex: true,
        birthday: "birthday",
        biography: "biography",
        password: "password",
        status: "status",
        admin: false);

    try {
      dynamic value = await getItemByID("user", id);

      if (value.isNotEmpty) {
        rs = User.fromJson(value[0]);
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching user data: $error');
    }
    // print(rsLst);
    return rs;
  }

  Future<List<User>> getUser() async {
    List<User> rsLst = List.filled(0, User(phoneNumber: 'phoneNumber', name: 'name', sex: true, birthday: 'birthday', biography: 'biography', password: 'password', status: 'true' , admin: false),growable: true);

    try {
      List<dynamic> value = await getItemByTitle("user", "user");

      if (value.isNotEmpty) {
        rsLst.clear();
        rsLst = value.map((json) => User.fromJson(json)).toList();
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error fetching data: $error');
    }
    // print(rsLst);
    return rsLst;
  }
}

// lấy thông tin người dùng theo số điện thoại
 