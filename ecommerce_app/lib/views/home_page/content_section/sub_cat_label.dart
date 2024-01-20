import 'package:flutter/material.dart';

class SubCatLabel extends StatelessWidget {
  const SubCatLabel({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Text(title, style: const TextStyle(fontSize: 18)),
        ));
  }
}
