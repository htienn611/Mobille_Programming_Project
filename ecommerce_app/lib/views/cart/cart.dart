import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/cart_detail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/cart_presenter.dart';
import 'package:ecommerce_app/presenters/cartdetail_presenter.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/cart/infoshopping.dart';
import 'package:ecommerce_app/views/cart/itemCart.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key, required this.phoneNumber});
  String phoneNumber;
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartDetail> dsSanPham = [];
  List<Product> prod = [];
  ProductPresenter proPre = ProductPresenter();
  CartPresenter cartPresenter = CartPresenter();
  CartDetailPresenter cdPre = CartDetailPresenter();
  Cart cart = Cart('', 0, 0);
  CartDetail cartDetail = CartDetail(0, 0, 0);
  double total = 0;
  void loaddata() async {
    //cart = await cartPresenter.getCartPhoneNumber(widget.phoneNumber);
    //cartDetail = await cdPre.getCartDetailByID(1);
    prod = await proPre.getProduct();
    dsSanPham.clear();
    dsSanPham = await cdPre.getlstCartDetail();
    total = 0;
    for (var item in dsSanPham) {
      total += item.quantity * item.product.price;
    }
    setState(() {});
  }

  Future<void> onDeleteCart(int idCart) async {
    await cdPre.deleteCart(idCart);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  @override
  Widget build(BuildContext context) {
    total = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 84, 75),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_rounded),
        title: Text(
          "Giỏ hàng",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChatScreen(
                            phoneNumber: widget.phoneNumber,
                          )),
                );
              },
              icon: const Icon(Icons.chat_bubble_outline_outlined)),
        ],
      ),
      body: Stack(
        children: [
          Container(),
          Positioned.fill(
              child: ListView.builder(
                  itemCount: dsSanPham.length,
                  itemBuilder: (context, index) => ItemCart(pro: prod[index]))),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                  top: 4.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Tổng tiền",
                            style:
                                TextStyle(color: Colors.black, fontSize: 17.0)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${total.toStringAsFixed(0)}\$',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 17.0),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                elevation: 0,
                                //shape: RoundedRectangleBorder(),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                  vertical: 8.0,
                                )),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InfoCartScreen()),
                              );
                            },
                            child: const Text(
                              'Tiếp tục',
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ]),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Mua sản phẩm khác'))),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
