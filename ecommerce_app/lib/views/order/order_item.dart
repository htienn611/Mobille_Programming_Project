import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/order_detail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';

class Item_Order extends StatefulWidget {
  Item_Order({super.key, required this.order});
  Order order;
  @override
  State<Item_Order> createState() => _Item_OrderState();
}


class _Item_OrderState extends State<Item_Order> {
  ProductPresenter proPre = ProductPresenter();
  OrderDetailPresenter orderPre=OrderDetailPresenter();
  late OrderDetail orderDetail;
  late Product product;
  void loaddata() async {
    orderDetail=await orderPre.getOrderDetailByID(widget.order.id);
   // product = await proPre.getProductByID(orderDetail.idProduct);

    setState(() {});
  }
  void loadProduct() async{
    product=await proPre.getProductByID(orderDetail.idProduct);
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
    loadProduct();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth - 20,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 227, 223, 222),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 3),
            )
          ]),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text(
                  "Trạng thái đơn hàng",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                widget.order.Status == 0
                    ? const Text("Chờ xác nhận")
                    : widget.order.Status == 1
                        ? const Text("Chờ giao hàng")
                        : widget.order.Status == 2
                            ? const Text("Đã giao")
                            : const Text("Đã hủy"),
              ],
            ),
            Column(
              children: [
                const Text(
                  "Ngày tạo",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.order.date.toString().split(" ")[0],
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Column(
              children: [
                Text(
                  "Tổng thanh toán",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "7.000.000đ",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          height: 0.5,
          decoration: const BoxDecoration(color: Colors.grey),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/img/laptop1.png',
              fit: BoxFit.cover,
              width: 100,
              height: 100,
            ),
            const SizedBox(
              width: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: (screenWidth-20)*0.6, //chinh lai
                  child: RichText(
                    text: TextSpan(
                      text: product.name,
                      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    maxLines: null,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${product.price}',
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(width: 70,),
                    const Text("x1"),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: const Text("Xem sản phẩm")),
                    const SizedBox(
                      width: 25,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color.fromARGB(255, 224, 84, 75))),
                      child: const Text(
                        "Hủy đơn",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
