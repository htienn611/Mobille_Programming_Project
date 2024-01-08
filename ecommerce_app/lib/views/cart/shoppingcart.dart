import 'package:ecommerce_app/views/cart/infoshopping.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        leading: Icon(Icons.arrow_back_rounded),
        title: Text('Giỏ hàng'),
        centerTitle: true,
        actions: [
          Icon(Icons.chat_bubble_outline_outlined),
        ],
      ),
      body: Stack(children: [Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: Color.fromARGB(96, 123, 118, 118),
              ),
              borderRadius: BorderRadius.circular(15.0),
              ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.shopping_cart_rounded, color: Colors.red, size: 45.0,),
                    Text('Chọn sản phẩm', style: TextStyle(color: Colors.red, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Colors.red,),
                Column(
                  children: [
                    Icon(Icons.medical_information_outlined, color: Colors.black, size: 45.0,),
                    Text('Thông tin', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded),
                Column(
                  children: [
                    Icon(Icons.payment_rounded, color: Colors.black, size: 45.0,),
                    Text('Thanh toán', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            height: 150.0,
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.purpleAccent), borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(width: 1.0, color: Colors.redAccent), borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: 130.0,
                    height: 140.0,
                  child: Image.asset('assets/img/laptop/laptop.jpg')
                  ),
                  Column(
                    
                    children: [
                      Text('Láp tóp đeo Vót Tro', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      Text('150.000đ', style: TextStyle(color: Colors.red),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 150.0,
                decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Tạm tính: '),
                          Text('150.000đ', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                  child: TextButton(child: Text('Thanh toán', style: TextStyle(color: Colors.white, fontSize: 20.0),), onPressed: (){
                    // Điều hướng đến một trang mới
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => InfoCartScreen()),
);

                  }, ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white, border: Border.all(width: 0.6, color: Colors.black)),
                  child: TextButton(child: Text('Mua sản phẩm khác', style: TextStyle(color: Colors.black, fontSize: 20.0),), onPressed: (){}, ),
                )
                ]
                ),
                )
              ),
          ),
        ],
    ),
    ]
    ),
    );
  }
}