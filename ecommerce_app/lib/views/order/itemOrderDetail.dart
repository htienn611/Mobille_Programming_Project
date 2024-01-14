import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class itemOrderDetail extends StatefulWidget {
  const itemOrderDetail({super.key});

  @override
  State<itemOrderDetail> createState() => _itemOrderDetailState();
}

class _itemOrderDetailState extends State<itemOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal:  BorderSide(color: Color.fromARGB(255, 243, 243, 243)))),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/img/laptop1.png',
                fit: BoxFit.cover,
                width: 20,
                height: 100,
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Laptop abc"),
                    const Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [Text("16.450.000đ"), Text("x1")],
                    )
                  ],
                ))
          ],
        ));
  }
}
