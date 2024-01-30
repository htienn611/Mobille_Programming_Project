import 'package:ecommerce_app/views/profile.dart';
import 'package:ecommerce_app/views/register.dart';
import 'package:ecommerce_app/views/routers.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
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
            const SizedBox(height: 50),
            const Center(
              child: Image(
                image: AssetImage('assets/img/logo/logo.jpg'),
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: "Số điện thoại",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: ElevatedButton(
                onPressed: () async {
                  UserPresenter userPresenter = UserPresenter(this);
                  await userPresenter.Login(
                    password: passwordController.text,
                    phoneNumber: phoneNumberController.text,
                  );
                  if (userPresenter.loginSuccessful == true) {
                    print("Luu sdt");
                    // Lưu trạng thái đăng nhập và số điện thoại
                    await userPresenter.saveLoginStatus(
                        true, phoneNumberController.text);
                    userPresenter.getSavedPhoneNumber();
                
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.fromLTRB(20, 10, 20, 10)),
                ),
                child: const Text("Đăng nhập", style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 12, left: 12),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Register()));
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.fromLTRB(20, 10, 20, 10)),
                ),
                child: const Text("Đăng ký", style: TextStyle(fontSize: 20)),
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
          title: const Text("Thông báo"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
