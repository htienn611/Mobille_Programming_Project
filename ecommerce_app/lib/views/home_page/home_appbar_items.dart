import 'package:ecommerce_app/views/cart/cart.dart';
import 'package:flutter/material.dart';

class HomePageAppbarItem extends StatefulWidget {
  const HomePageAppbarItem({super.key, required this.phone});
  final phone;
  @override
  State<HomePageAppbarItem> createState() => _HomePageAppbarItemState();
}

class _HomePageAppbarItemState extends State<HomePageAppbarItem> {
  @override
  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: sW - 5,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/img/logo/logo.jpg'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: TextEditingController(),
                decoration: InputDecoration(
                    hintText: "Bạn muốn tìm gì?",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8)),
                    suffixIcon: IconButton(
                        onPressed: () {}, icon: const Icon(Icons.search))),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CartScreen(phoneNumber: widget.phone),
                        ));
                  },
                  icon: const Icon(
                    Icons.add_shopping_cart_sharp,
                    size: 32,
                  )),
              Positioned(
                  top: 3,
                  right: 8,
                  child: Container(
                    width: 13,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      "0",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 224, 84, 75)),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
