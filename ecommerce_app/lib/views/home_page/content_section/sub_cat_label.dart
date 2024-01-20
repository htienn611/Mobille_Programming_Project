// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:ecommerce_app/models/brand.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:flutter/material.dart';

class SubCatLabel extends StatefulWidget {
  const SubCatLabel(
      {super.key, required this.object, required this.reLoadProduct});
  final object;
  final Function reLoadProduct;
  @override
  State<SubCatLabel> createState() => _SubCatLabelState();
}

class _SubCatLabelState extends State<SubCatLabel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()async {
          widget.reLoadProduct();
          setState(() {
            
          });
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Text(
              widget.object is Category
                  ? (widget.object as Category).nameCate
                  : (widget.object as Brand).name,
              style: const TextStyle(fontSize: 18)),
        ));
  }
}
