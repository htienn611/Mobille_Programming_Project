import 'package:flutter/material.dart';

class PayShoppingScreen extends StatelessWidget {
  const PayShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        leading: Icon(Icons.arrow_back_rounded),
        title: Text('Thanh toán'),
        centerTitle: true,
        actions: [
          Icon(Icons.chat_bubble_outline_outlined),
        ],
      ),
      body: Stack(
        children: [
      Column(
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
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(Icons.shopping_cart_rounded, color: Colors.black, size: 45.0,),
                    Text('Chọn sản phẩm', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Colors.black,),
                Column(
                  children: [
                    Icon(Icons.medical_information_outlined, color: Colors.black, size: 45.0,),
                    Text('Thông tin', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
                Icon(Icons.arrow_right_alt_rounded, color: Colors.black,),
                Column(
                  children: [
                    Icon(Icons.payment_rounded, color: Colors.red, size: 45.0,),
                    Text('Thanh toán', style: TextStyle(color: Colors.red, fontSize: 15.0),)
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only( top: 10.0),
                width: 150.0,
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/logo/MoMo_Logo.png', width: 40.0, height: 40.0,),
                    //SizedBox(width: 5.0,),
                    Text('Momo\nWallet', style: TextStyle(fontSize: 15.0),),
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.0),
                width: 150.0,
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.deepPurpleAccent),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/logo/money.jpg', width: 40.0, height: 40.0,),
                    SizedBox(width: 5.0,),
                    Text('Tiền mặt', style: TextStyle(fontSize: 15.0),),
                ]),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text('Chi tiết giao dịch', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            height: 370.0,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Họ và tên', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('Huỳnh Gia Bảo', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0,),
                  height: 0.5,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số tiền thanh toán', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('100.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Vận chuyển', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('30.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giảm giá', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('-10.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thành tiền', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('120.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  height: 60.0,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle_outline_rounded, color: Colors.indigoAccent, size: 40.0,),
                      SizedBox(width: 5.0,),
                      Text('Thêm thẻ giảm giá', style: TextStyle(color: Colors.indigoAccent, fontSize: 17.0),)
                    ],
                  ),)
                  ),
            ]),
          )
        ]
    ),
    Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100.0,
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
                          Container(margin: EdgeInsets.only(top: 7.0),child:Text('Thanh toán số tiền',style: TextStyle(color: Colors.black, fontSize: 15.0),),),
                          Container(margin: EdgeInsets.only(top: 7.0),child:Text('120.000đ', style: TextStyle(color: Colors.red, fontSize: 15.0),),),
                          ],
                      ),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                  child: TextButton(child: Text('Thanh toán', style: TextStyle(color: Colors.white, fontSize: 20.0),), onPressed: (){}, ),
                )
                  ]
                ),
                )
              ),
          ),
      ]
      )
    );
  }
}