import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/presenters/cart_presenter.dart';
import 'package:ecommerce_app/views/cart/infoshopping.dart';
import 'package:ecommerce_app/views/cart/itemCart.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  final CartPresenter _cartPresenter = CartPresenter();
  List<Cart> _carts = List.filled(0, Cart("", 0, 0), growable: true);

  void _loadData() async {
    _carts = await _cartPresenter.getlstOrder();
    setState(() {});
  }

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
      body: ListView.builder(
              itemCount: _carts.length,
              itemBuilder: (context, index) {
                return ItemCart(cart: _carts[index]);
              },
      )
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Container(
      //         padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      //         margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      //         height: 100.0,
      //         decoration: BoxDecoration(
      //           border: Border.all(
      //             width: 2.0,
      //             color: Color.fromARGB(96, 123, 118, 118),
      //           ),
      //           borderRadius: BorderRadius.circular(15.0),
      //         ),
      //         child: const Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Column(
      //               children: [
      //                 Icon(
      //                   Icons.shopping_cart_rounded,
      //                   color: Colors.red,
      //                   size: 45.0,
      //                 ),
      //                 Text(
      //                   'Chọn sản phẩm',
      //                   style: TextStyle(color: Colors.red, fontSize: 15.0),
      //                 )
      //               ],
      //             ),
      //             Icon(
      //               Icons.arrow_right_alt_rounded,
      //               color: Colors.red,
      //             ),
      //             Column(
      //               children: [
      //                 Icon(
      //                   Icons.medical_information_outlined,
      //                   color: Colors.black,
      //                   size: 45.0,
      //                 ),
      //                 Text(
      //                   'Thông tin',
      //                   style: TextStyle(color: Colors.black, fontSize: 15.0),
      //                 )
      //               ],
      //             ),
      //             Icon(Icons.arrow_right_alt_rounded),
      //             Column(
      //               children: [
      //                 Icon(
      //                   Icons.payment_rounded,
      //                   color: Colors.black,
      //                   size: 45.0,
      //                 ),
      //                 Text(
      //                   'Thanh toán',
      //                   style: TextStyle(color: Colors.black, fontSize: 15.0),
      //                 )
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
            
      //       ),
      //       Container(
      //           height: 150.0,
      //           decoration: BoxDecoration(
      //             border: Border.all(width: 2.0, color: Colors.black),
      //             borderRadius: BorderRadius.only(
      //                 topLeft: Radius.circular(40.0),
      //                 topRight: Radius.circular(40.0)),
      //           ),
      //           child: Center(
      //             child: Column(children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Text('Tạm tính: '),
      //                   Text(
      //                     '150.000đ',
      //                     style: TextStyle(color: Colors.red),
      //                   ),
      //                 ],
      //               ),
      //               Container(
      //                 margin: EdgeInsets.only(top: 5.0),
      //                 width: 300.0,
      //                 height: 50.0,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20.0),
      //                     color: Colors.red),
      //                 child: TextButton(
      //                   child: Text(
      //                     'Thanh toán',
      //                     style: TextStyle(color: Colors.white, fontSize: 20.0),
      //                   ),
      //                   onPressed: () {
      //                     // Điều hướng đến một trang mới
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => InfoCartScreen()),
      //                     );
      //                   },
      //                 ),
      //               ),
      //               Container(
      //                 margin: EdgeInsets.only(top: 5.0),
      //                 width: 300.0,
      //                 height: 50.0,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20.0),
      //                     color: Colors.white,
      //                     border: Border.all(width: 0.6, color: Colors.black)),
      //                 child: TextButton(
      //                   child: Text(
      //                     'Mua sản phẩm khác',
      //                     style: TextStyle(color: Colors.black, fontSize: 20.0),
      //                   ),
      //                   onPressed: () {},
      //                 ),
      //               )
      //             ]),
      //           )),
      
      //     ],
    
      //   ),
    );
  }
}
