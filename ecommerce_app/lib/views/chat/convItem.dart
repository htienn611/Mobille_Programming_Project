import 'package:ecommerce_app/models/user.dart';
import 'package:ecommerce_app/presenters/user_presenter.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:flutter/material.dart';

class ConvItem extends StatelessWidget {
  ConvItem({super.key, required this.us, required this.openn});
  final User us;
  Function(String) openn;
  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(fontSize: 18);
    return GestureDetector(
        onTap: () {
          openn(us.phoneNumber);
        },
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                us.name,
                style: style,
              ),
              Text(
                us.phoneNumber,
                style: style,
              ),
            ],
          ),
        ));
  }
}

class ConvList extends StatefulWidget {
  const ConvList({super.key, required this.admin});
  final String admin;
  @override
  State<ConvList> createState() => _ConvListState();
}

class _ConvListState extends State<ConvList> implements UserView {
  late UserPresenter usPre;
  List<User> uss = List.filled(
      0,
      User(
          phoneNumber: 'phoneNumber',
          name: 'name',
          sex: true,
          birthday: 'birthday',
          biography: 'biography',
          password: 'password',
          status: 'status',
          admin: true),
      growable: true);
  Future<void> loadData() async {
    usPre = UserPresenter(this);
    uss = await usPre.getUser();
  }

  void openChat(us1) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ChatScreen(phoneNumber: widget.admin, us1: us1),
        ));
  }

  @override
  void initState() {
    super.initState();
    loadData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 84, 75),
        title: const Text(
          "Danh sách khách hàng",
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: uss.length,
            itemBuilder: (context, index) =>
                ConvItem(us: uss[index], openn: openChat),
          )),
        ],
      ),
    );
  }

  @override
  void displayMessage(String message) {}
}
