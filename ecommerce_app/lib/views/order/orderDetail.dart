import 'package:ecommerce_app/views/order/itemOrderDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class orderDetail extends StatefulWidget {
  const orderDetail({super.key});

  @override
  State<orderDetail> createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
      ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_double_arrow_left_rounded),
        ),
        title: Text("Thông tin đơn hàng"),
        backgroundColor: Color.fromARGB(255, 224, 84, 75),
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            margin: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
            decoration: BoxDecoration(
                border: Border.all(color: (Color.fromARGB(255, 246, 212, 210)))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      "Địa chỉ nhận hàng",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Text(
                      "Đang giao hàng",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Tên người nhận: Nguyễn Ngọc Như Ý",
                    style: TextStyle(fontSize: 16)),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Số điện thoại: 0395060907",
                    style: TextStyle(fontSize: 16)),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Địa chỉ: 793/28Trần Xuân Soạn",
                    style: TextStyle(fontSize: 16))
              ],
            ),
          ),
         
          itemOrderDetail(),
          itemOrderDetail(),
        


          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tổng tiền hàng: ",style: TextStyle(fontSize: 16,),),
              Text("38.440.000đ",style: TextStyle(fontSize: 16,),),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Phí vận chuyển: ",style: TextStyle(fontSize: 16,),),
              Text("0đ",style: TextStyle(fontSize: 16,),),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Giảm giá: ",style: TextStyle(fontSize: 16,),),
              Text("0đ",style: TextStyle(fontSize: 16,),),
            ],
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Thành tiền: ",style: TextStyle(fontSize: 16,),),
              Text("38.440.000đ",style: TextStyle(fontSize: 16,),),
            ],
          )
          ],
          ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.symmetric(horizontal: BorderSide(color: Color.fromARGB(255, 243, 243, 243)),vertical: BorderSide.none)
            ),
            child: Row(
              children: [
                Icon(Icons.money_outlined ,color: Colors.red),
                Padding(padding: EdgeInsets.all(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Phương thức thanh toán",style: TextStyle(
                      fontSize: 18,
                      color: Colors.red
                    ),),
                    Text("Thanh toán khi nhận hàng",style: TextStyle(color: Colors.grey),)
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   border: Border.symmetric(horizontal: BorderSide(color: Colors.grey),vertical: BorderSide.none)
            // ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mã đơn hàng: ",style: TextStyle(fontSize: 18),),
                  Text("LT0123",style: TextStyle(color: Colors.grey)),
                ],
              ),
                 Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ngày đặt hàng: ",style: TextStyle(fontSize: 18)),
                  Text("03/01/2024",style: TextStyle(color: Colors.grey),),
                ],
              )
            ]),
          )
       
        ],
      ),
      )
    );
  }
}
