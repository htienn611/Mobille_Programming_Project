import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> implements UserView {
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController birthdayController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool isValidDateFormat(String input) {
    // Kiểm tra xem chuỗi có phải là định dạng yyyy-mm-dd không
    final regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!regex.hasMatch(input)) {
      return false;
    }
    // Tách ngày, tháng, năm từ chuỗi
    List<String> parts = input.split('-');

    // Kiểm tra xem các giá trị ngày, tháng, năm có hợp lệ không
    int year = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int day = int.parse(parts[2]);

    if (year < 1000 ||
        year > 9999 ||
        month < 1 ||
        month > 12 ||
        day < 1 ||
        day > 31) {
      return false;
    }

    // Kiểm tra tháng 2
    if (month == 2) {
      bool isLeapYear = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
      if (day > 29 || (day > 28 && !isLeapYear)) {
        return false;
      }
    }

    // Kiểm tra số ngày của tháng
    if ([4, 6, 9, 11].contains(month) && day > 30) {
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    birthdayController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: SizedBox(
          width: MediaQuery.of(context).size.width - 150,
          child: const Text(
            "ĐĂNG KÝ",
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
            const SizedBox(height: 40),
            const Center(
              child: Image(
                image: AssetImage('assets/img/logo/logo.jpg'),
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  labelText: "Họ và tên",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: "Số điện thoại",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.datetime,
                controller: birthdayController,
                decoration: const InputDecoration(
                  labelText: "Ngày sinh",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Mật khẩu",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Nhập lại mật khẩu",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            ElevatedButton(
              onPressed: () {
                // Kiểm tra điều kiện trường null và độ dài mật khẩu
                if (fullNameController.text.isEmpty ||
                    phoneNumberController.text.isEmpty ||
                    birthdayController.text.isEmpty ||
                    passwordController.text.isEmpty ||
                    confirmPasswordController.text.isEmpty) {
                  displayMessage('Vui lòng điền đầy đủ thông tin đăng ký.');
                  return;
                }
                if (phoneNumberController.text.length != 10) {
                  displayMessage('Số điện thoại phải có đúng 10 số.');
                  return;
                }

                if (passwordController.text.length < 6) {
                  displayMessage('Mật khẩu phải có ít nhất 6 ký tự.');
                  return;
                }

                if (passwordController.text != confirmPasswordController.text) {
                  displayMessage('Mật khẩu và Nhập lại mật khẩu không khớp.');
                  return;
                }
                if (!isValidDateFormat(birthdayController.text)) {
                  displayMessage(
                      'Ngày sinh không hợp lệ. Vui lòng nhập theo định dạng yyyy-mm-dd và phải hợp lệ');
                  return;
                }
                // Gọi phương thức Register từ UserPresenter
                UserPresenter userPresenter = UserPresenter(this);
                userPresenter.Register(
                  birthday: birthdayController.text,
                  password: passwordController.text,
                  name: fullNameController.text,
                  phoneNumber: phoneNumberController.text,
                );

                Navigator.pop(this.context);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              ),
              child: const Text(
                "Đăng ký",
                style: TextStyle(fontSize: 20),
              ),
            )
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
