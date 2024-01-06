import 'package:ecommerce_app/views/oneProduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(5),
        itemCount: 8,
        itemBuilder: (context, index) {
          return OneProduct();
        });
  }
}
