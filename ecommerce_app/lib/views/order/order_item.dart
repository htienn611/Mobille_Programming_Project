import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/views/order/orderDetail.dart';

// ignore: must_be_immutable
class ItemOrder extends StatefulWidget {
  ItemOrder({super.key, required this.order});
  Order order;
  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  late int orderStatus;
  ProductPresenter proPre = ProductPresenter();
  OrderDetailPresenter orderDetailPre = OrderDetailPresenter();
  OrderPresenter orderPre = OrderPresenter();
  late OrderDetail orderDetail;
  late Product product;
  late bool updateOrder = false;
  void loadData() async {
    product = await proPre.getOneProduct(widget.order.id);
    orderDetail = await orderDetailPre.getOrderDetailByID(widget.order.id);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
    orderStatus = widget.order.Status;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    //print(widget.order.date);
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
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
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
                orderStatus == 0
                    ? const Text("Chờ xác nhận")
                    : orderStatus == 1
                        ? const Text("Chờ giao hàng")
                        : orderStatus == 2
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
                  // ignore: unnecessary_string_interpolations
                  '${widget.order.date.toString().split(" ")[0]}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
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
              width: 75,
              height: 75,
            ),
            const SizedBox(
              width: 5,
            ),
            Column(
              children: [
                SizedBox(
                  width: (screenWidth - 20) * 0.6,
                  child: RichText(
                    text: TextSpan(
                      // ignore: unnecessary_string_interpolations
                      text: '${product.name}',
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: (screenWidth - 20) * 0.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.price}',
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text('${orderDetail.quantityProduct}'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Order_Detail(
                                idOrder: widget.order.id,
                              ),
                            ),
                          );
                        },
                        child: Text("xem thêm")),
                    const SizedBox(
                      width: 50,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (orderStatus == 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Xác nhận"),
                                content: const Text(
                                    "Bạn có chắc chắn muốn hủy đơn không?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Hủy bỏ")),
                                  TextButton(
                                      onPressed: () async {
                                        updateOrder = await orderPre
                                            .updateStatusOrder(widget.order);
                                        if (updateOrder) {
                                          orderStatus = 3;
                                          widget.order.Status = orderStatus;
                                          widget.order.Status == 3;
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        }
                                      },
                                      child: const Text("Xác nhận"))
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  title: const Text("Thông báo"),
                                  content: const Text("Bạn không thể hủy đơn"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("OK")),
                                  ]);
                            },
                          );
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text("Hủy đơn",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) =>
                                  const Color.fromARGB(255, 224, 84, 75))),
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
