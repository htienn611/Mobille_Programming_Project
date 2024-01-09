import 'package:flutter/material.dart';

class CatLabel extends StatelessWidget {
  const CatLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
      child: const Text('Danh mục', style: TextStyle(fontSize: 18)),
    );
  }
}
