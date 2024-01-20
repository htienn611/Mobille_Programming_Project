import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String phoneNumber;

  const Profile({required this.phoneNumber, Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> implements UserView {
  late UserPresenter userPresenter;
  late TextEditingController nameController;
  late TextEditingController sexController;
  late TextEditingController birthdayController;
  late TextEditingController phoneNumberController;
  late TextEditingController biographyController;
  User? user;

  @override
  void initState() {
    super.initState();
    userPresenter = UserPresenter(this);
    nameController = TextEditingController();
    sexController = TextEditingController();
    birthdayController = TextEditingController();
    phoneNumberController = TextEditingController();
    biographyController = TextEditingController();

    _loadUserByPhoneNumber();
  }

  Future<void> _loadUserByPhoneNumber() async {
    try {
      User? fetchedUser = await userPresenter.getUserByPhoneNumber(widget.phoneNumber);

      if (fetchedUser != null) {
        setState(() {
          user = fetchedUser;
          // Set initial values for text controllers
          nameController.text = user!.name;
          sexController.text = user!.sex ? "Nam" : "Nữ";
          birthdayController.text = user!.birthday;
          phoneNumberController.text = user!.phoneNumber;
          biographyController.text = user!.biography;
          print(biographyController.text);
          print(1);
        });
      }
    } catch (error) {
      print('Error loading user data: $error');
    }
  }

  Future<void> _selectGender() async {
    bool? isMale = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn giới tính'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Nam
                },
                child: Text('Nam'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Nữ
                },
                child: Text('Nữ'),
              ),
            ],
          ),
        );
      },
    );

    if (isMale != null) {
      setState(() {
        sexController.text = isMale ? 'Nam' : 'Nữ';
      });
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
            "THÔNG TIN CÁ NHÂN",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              bool updateSuccess = await userPresenter.updateUser(
                phoneNumber: widget.phoneNumber,
                name: nameController.text,
                sex: sexController.text=="Nam",
                birthday: birthdayController.text,
                biography: biographyController.text,
              );

              if (updateSuccess) {
                // Handle successful update, e.g., show a success message
                print('User updated successfully');
              } else {
                // Handle update failure, e.g., show an error message
                print('Failed to update user');
              }
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/meo.jpg'),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Tên:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: sexController,
                decoration: InputDecoration(
                  labelText: "Giới tính:",
                  suffixIcon: IconButton(
                    onPressed: _selectGender,
                    icon: Icon(Icons.arrow_forward_ios),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: birthdayController,
                decoration: InputDecoration(
                  labelText: "Ngày sinh:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: "SĐT:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: biographyController,
                decoration: InputDecoration(
                  labelText: "Tiểu sử",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 9),
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
