import 'package:ecommerce_app/views/cart/payshopping.dart';
import 'package:flutter/material.dart';

class InfoCartScreen extends StatelessWidget {
  const InfoCartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    int _selectedValue = 0;
    bool isChecked = false;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        leading: const Icon(Icons.arrow_back_rounded),
        title: const Text('Giỏ hàng'),
        centerTitle: true,
        actions: [
          const Icon(Icons.chat_bubble_outline_outlined),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children:const [
                     Icon(Icons.shopping_cart_rounded, color: Colors.black, size: 45.0,),
                     Text('Chọn sản phẩm', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
                const Icon(Icons.arrow_right_alt_rounded, color: Colors.black,),
                Column(
                  children: [
                    const Icon(Icons.medical_information_outlined, color: Colors.red, size: 45.0,),
                    const Text('Thông tin', style: TextStyle(color: Colors.red, fontSize: 15.0),)
                  ],
                ),
                const Icon(Icons.arrow_right_alt_rounded, color: Colors.red,),
                Column(
                  children: [
                    const Icon(Icons.payment_rounded, color: Colors.black, size: 45.0,),
                    const Text('Thanh toán', style: TextStyle(color: Colors.black, fontSize: 15.0),)
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 460.0,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.black38,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
              children: [
                const Text('Thông tin khách hàng', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                const SizedBox(height: 10.0,),
                TextField(
              decoration: InputDecoration(labelText: "Họ và tên (Bắt buộc)", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0)
              )),
            ),
            const SizedBox(height: 15.0,),
            TextField(
              decoration: InputDecoration(labelText: "Số điện thoại (Bắt buộc)", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40.0)
              )),
              
            ),
            const SizedBox(height: 10.0,),
            const Text('Cách thức giao hàng', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            
            Container( child: Row(children: [
            Checkbox(
            value: true,
            onChanged: (bool? value) {
            },
          ),
          const Text('Giao tận nơi'),
          Checkbox(
            value: false,
            onChanged: (bool? value) {
            },
          ),
          const Text('Nhận tại cửa hàng'),
            ],
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 150.0,
                  height: 40.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "--Tỉnh/Thành--", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                ),
                Container(
                  width: 190.0,
                  height: 40.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "--Quận/Huyện--", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                )
              ],
            ),
            const SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 125.0,
                  height: 40.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "--Phường/Xã--", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                ),
                Container(
                  width: 225.0,
                  height: 40.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "--Địa chỉ cụ thể--", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                ),
              ],
            ),
            const SizedBox(height: 5.0,),
            Container(
                  height: 100.0,
                  child: TextField(
              decoration: InputDecoration(labelText: "Ghi chú", 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
              )),
              
            ),
                ),
              ],
            ),
            )
          ),
          Container(
                height: 150.0,
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
                          const Text('Số tiền thanh toán: '),
                          const Text('120.000đ', style: TextStyle(color: Colors.red),),
                        ],
                      ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.red),
                  child: TextButton(child: const Text('Tiếp tục', style: TextStyle(color: Colors.white, fontSize: 20.0),), onPressed: (){
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const PayShoppingScreen()),
);
                  }, ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  width: 300.0,
                  height: 50.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: Colors.white, border: Border.all(width: 0.6, color: Colors.black)),
                  child: TextButton(child: const Text('Mua sản phẩm khác', style: TextStyle(color: Colors.black, fontSize: 20.0),), onPressed: (){

                  }, ),
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