import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: Image.asset(
              'assets/img/logo/logo.jpg',
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
