import 'package:flutter/material.dart';

class ChatAppbarItems extends StatefulWidget {
  const ChatAppbarItems({super.key});

  @override
  State<ChatAppbarItems> createState() => _ChatAppbarItemsState();
}

class _ChatAppbarItemsState extends State<ChatAppbarItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 25,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img/logo/logo.jpg',
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hỗ trợ trực tuyến",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text("Sẵn sàng giải đáp mọi thắc mắc",
                      style: TextStyle(color: Colors.white)),
                ],
              )
            ],
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Text(
                "X",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
