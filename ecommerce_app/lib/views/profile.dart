import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:ecommerce_app/views/routers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../presenters/fireBaseApi.dart';
import '../presenters/noti_presenter.dart';

class Profile extends StatefulWidget {
  String phoneNumber;

   Profile({required this.phoneNumber, Key? key}) : super(key: key);
  
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> implements UserView {
  late UserPresenter userPresenter;
  late TextEditingController nameController;
  late TextEditingController sexController;
  late TextEditingController birthdayController;
  late TextEditingController phoneNumberController;
                Notification_Presenter NotiPresenter = Notification_Presenter();
  late TextEditingController biographyController;
  User? user;
NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    print(widget.phoneNumber);
    super.initState();
    userPresenter = UserPresenter(this);
    nameController = TextEditingController();
    sexController = TextEditingController();
    birthdayController = TextEditingController();
    phoneNumberController = TextEditingController();
    biographyController = TextEditingController();
 notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.isTokenRefresh();

    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
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
          title: const Text('Chọn giới tính'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Nam
                },
                child: const Text('Nam'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Nữ
                },
                child: const Text('Nữ'),
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
         automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Text(
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
                sendNotificationAfterChangeProfile();
                NotiPresenter.InsertNoti(
                  phoneNumber: phoneNumberController.text,
                  content: "Bạn vừa cập nhật thông tin",
                );
              } else {
                // Handle update failure, e.g., show an error message
                print('Failed to update user');
              }
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const Image(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/img/meo.jpg'),
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Tên:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: sexController,
                decoration: InputDecoration(
                  labelText: "Giới tính:",
                  suffixIcon: IconButton(
                    onPressed: _selectGender,
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: birthdayController,
                decoration: const InputDecoration(
                  labelText: "Ngày sinh:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                readOnly: true,
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  labelText: "SĐT:",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: biographyController,
                decoration: const InputDecoration(
                  labelText: "Tiểu sử",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 9),
            ElevatedButton(
              onPressed: (){
               UserPresenter userPresenter = UserPresenter(this);
               userPresenter.clearSharedPreferences();
              Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                      builder: (context) => const Routers(),
                      ),
                    );
                   
            }, child: Text('Đăng xuất',
            style: TextStyle(fontSize: 20),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                padding: MaterialStateProperty.all(
                    const EdgeInsets.fromLTRB(20, 10, 20, 10)),
              )
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
  
  void sendNotificationAfterChangeProfile() async {
    final deviceToken = await notificationServices.getDeviceToken();

    await notificationServices.sendFCMNotification(
        title: 'Change Profile Success',
        body: 'You have change information!',
        deviceToken: deviceToken);
  }
}
