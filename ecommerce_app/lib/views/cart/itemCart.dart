
import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  ItemCart({super.key, required this.cart});
  Cart cart;
  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      decoration: BoxDecoration(border: Border.all(
        width: 1.0,
        color: const Color.fromARGB(255, 206, 70, 40),
      )),
      child: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(border: Border.all(
          width: 0.5,
          color: Colors.black45,
        ),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Text('${widget.cart.phoneNumber}'),
              ],

            ),
            Column(
              children: [
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete_outline_rounded)),
              ],

            )
          ],
        ),
      ),
    );
  }
}
