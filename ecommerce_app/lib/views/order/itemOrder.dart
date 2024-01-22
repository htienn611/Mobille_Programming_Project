import 'package:ecommerce_app/models/order.dart';
import 'package:flutter/material.dart';

class ItemOrder extends StatefulWidget {
   ItemOrder({super.key,required this.order});
   Order order;


  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
             color: Color.fromARGB(255, 238, 199, 184),
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
              Text('${widget.order.Status}',style: const TextStyle(fontSize: 13,color: Colors.black),),
            ],
          ),
          Text('${widget.order.id}',style: const TextStyle(fontSize: 15,color: Colors.black),),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("16.450.000đ",style: TextStyle(fontSize: 13,color: Colors.black)),
              Text("x1",style: TextStyle(fontSize: 13,color: Colors.black)),
            ],

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Thành tiền:16.450.000 ",style: TextStyle(fontSize: 13,color: Colors.black)),
              OutlinedButton(onPressed: (){},style: ButtonStyle(backgroundColor:MaterialStateColor.resolveWith((states) => const Color.fromARGB(255, 224, 84, 75))), child: const Text("Hủy đơn",style: TextStyle(color: Colors.white),),)
             
            ],
          )
        ],
      ),
    );
  }
}