import 'package:flutter/material.dart';

class SubCatLabel extends StatelessWidget {
 const SubCatLabel({super.key, this.isBestSelling=false});
  final bool isBestSelling;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(5)),
      child:  Text(isBestSelling?'Danh mục':'nhãn hiệu', style: const TextStyle(fontSize: 18)),
    );
  }
}
