import 'package:flutter/material.dart';

class PayShoppingScreen extends StatefulWidget {
  const PayShoppingScreen({super.key});

  @override
  State<PayShoppingScreen> createState() => _PayShoppingScreenState();
}

class _PayShoppingScreenState extends State<PayShoppingScreen> {
  Color colormomo = Colors.blue;
  Color colorpay = Colors.black;
  double wmomo = 4.0;
  double wpay = 2.0;

  void colormomoclick(){
    setState(() {
    colormomo = Colors.blue;
    colorpay = Colors.black;
    wmomo = 4.0;
    wpay = 2.0;
    });
  }

    void _colorpayclick() {
      setState(() {
        colormomo = Colors.black;
        colorpay = Colors.blue;
        wpay = 4.0;
        wmomo = 2.0;
      });
    }
  @override
  Widget build(BuildContext context) {

  

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_rounded),onPressed: (){Navigator.pop(context);}),
        title: const Text(
          "Giỏ hàng",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child:
      Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            margin: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
            height: 100.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2.0,
                color: const Color.fromARGB(96, 123, 118, 118),
              ),
              borderRadius: BorderRadius.circular(15.0),
              ),
            child:const Row(
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
              GestureDetector(
                onTap: colormomoclick,
              child: Container(
                margin: const EdgeInsets.only( top: 10.0),
                width: 150.0,
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(width: wmomo, color: colormomo),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/img/logo/MoMo_Logo.png', width: 40.0, height: 40.0,),
                    //SizedBox(width: 5.0,),
                    const Text('Momo\nWallet', style: TextStyle(fontSize: 15.0),),
                ]),
              ),
              ),
              GestureDetector( 
                onTap: colormomoclick,
                child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: 150.0,
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(width: wpay, color: colorpay),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/img/logo/money.jpg', width: 40.0, height: 40.0,),
                    const SizedBox(width: 5.0,),
                    const Text('Tiền mặt', style: TextStyle(fontSize: 15.0),),
                ]),
              ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0, top: 10.0),
              child: const Text('Chi tiết giao dịch', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),)
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 400.0,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black),
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Họ và tên', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('Huỳnh Gia Bảo', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0,),
                  height: 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số tiền thanh toán', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('100.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Vận chuyển', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('30.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Giảm giá', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('-10.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 0.5,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Colors.grey)),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 25.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Thành tiền', style: TextStyle(fontSize: 20.0, color: Colors.black26),),
                  Text('120.000đ', style: TextStyle(fontSize: 20.0),),
                ],)
                ),
                
            ]),
          ),
          Container(
                height: 100.0,
                decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.black),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(margin: const EdgeInsets.only(top: 7.0),child:const Text('Thanh toán số tiền',style: TextStyle(color: Colors.black, fontSize: 15.0),),),
                          Container(margin: const EdgeInsets.only(top: 7.0),child:const Text('120.000đ', style: TextStyle(color: Colors.red, fontSize: 15.0),),),
                          ],
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                  child: TextButton(child: const Text('Thanh toán', style: TextStyle(color: Colors.white, fontSize: 20.0),), onPressed: (){}, ),
                )
                  ]
                ),
                )
              ),
        ]
    ),
    
      )
    );
  }
}
