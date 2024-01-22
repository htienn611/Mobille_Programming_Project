import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:ecommerce_app/views/register.dart';
import 'package:ecommerce_app/views/routers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presenters/user_presenter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> implements UserView {
  late TextEditingController phoneNumberController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus() async {
    UserPresenter userPresenter = UserPresenter(this);
    bool isLoggedIn = await userPresenter.getLoginStatus();
    if (isLoggedIn) {
      String savedPhoneNumber = await userPresenter.getSavedPhoneNumber();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Profile(phoneNumber: savedPhoneNumber)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Text(
            "ĐĂNG NHẬP",
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(
              child: Image(
                image: AssetImage('assets/img/logo/logo.jpg'),
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "Số điện thoại",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12, left: 12),
              child: ElevatedButton(
                onPressed: () async {
                  UserPresenter userPresenter = UserPresenter(this);
                  await userPresenter.Login(
                    password: passwordController.text,
                    phoneNumber: phoneNumberController.text,
                  );
                  if (userPresenter.loginSuccessful == true) {
                    // Lưu trạng thái đăng nhập và số điện thoại
                    await userPresenter.saveLoginStatus(true, phoneNumberController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => Routers(),
                        
                        //builder: (context) => Profile(phoneNumber: phoneNumberController.text),
                      ),
                    );
                  }
                },
                child: Text("Đăng nhập", style: TextStyle(fontSize: 20)),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20, 10, 20, 10)),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12, left: 12),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
                child: Text("Đăng ký", style: TextStyle(fontSize: 20)),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20, 10, 20, 10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void displayMessage(String message) {
    // Hiển thị thông báo đăng ký
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Thông báo"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
