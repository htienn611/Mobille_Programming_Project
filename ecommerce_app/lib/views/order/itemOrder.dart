import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class itemOrder extends StatefulWidget {
  const itemOrder({super.key});

  @override
  State<itemOrder> createState() => _itemOrderState();
}

class _itemOrderState extends State<itemOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 234, 230),

        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
             color: Color.fromARGB(255, 255, 211, 198),
             blurRadius: 5,
             spreadRadius: 2,
             offset: Offset(0, 3),
            
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Chờ xác nhận",style: TextStyle(fontSize: 13,color: Colors.black),),
            ],
          ),
          Text("Laptop ABC",style: TextStyle(fontSize: 15,color: Colors.black),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("16.450.000đ",style: TextStyle(fontSize: 13,color: Colors.black)),
              Text("x1",style: TextStyle(fontSize: 13,color: Colors.black)),
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Thành tiền:16.450.000 ",style: TextStyle(fontSize: 13,color: Colors.black)),
              OutlinedButton(onPressed: (){}, child: Text("Hủy đơn",style: TextStyle(color: Colors.white),),style: ButtonStyle(backgroundColor:MaterialStateColor.resolveWith((states) => Color.fromARGB(255, 236, 125, 91))),)
             
            ],
          )
        ],
      ),
    );
  }
}