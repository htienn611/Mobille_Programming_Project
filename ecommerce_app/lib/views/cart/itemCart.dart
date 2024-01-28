import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/cart.dart';
import 'package:ecommerce_app/models/cart_detail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/cart_presenter.dart';
import 'package:ecommerce_app/presenters/cartdetail_presenter.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  ItemCart({super.key, required this.pro});
  Product pro;
  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  List<CartDetail> ds = [];
  List<Cart> dsCart = [];
  CartDetail cartDetail = CartDetail(0, 0, 0);
  CartDetailPresenter cdPre = CartDetailPresenter();
  CartPresenter cartPresenter = CartPresenter();
  double total = 0;
  void loaddata() async {
    cartDetail = await cdPre.getCartDetailByID(widget.pro.id);
    for (var item in ds) {
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
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 150,
        width: 100,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: widget.pro.image == Null
                      ? const Text('Không load được ảnh')
                      : Image.network(widget.pro.image),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.pro.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                    Text('\$ ${widget.pro.price}',
                        style:
                            const TextStyle(color: Colors.red, fontSize: 15.0)),
                  ],
                ),
                const Spacer(),
                Column(
                  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        
                        children: [
                          IconButton(
                              onPressed: () async {
                                await onDeleteCart(widget.pro.id);
                              },
                              icon: const Icon(Icons.delete_forever_rounded)),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  cartDetail.quantity > 1
                                      ? cartDetail.quantity -= 1
                                      : cartDetail.quantity += 0;
                                      print('giảm còn ${cartDetail.quantity}');
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            child: Text("${cartDetail.quantity}"),
                          ),
                          Container(
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  cartDetail.quantity < 100
                                      ? cartDetail.quantity += 1
                                      : cartDetail.quantity += 0;
                                      print('tăng lên ${cartDetail.quantity}');
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          )
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}