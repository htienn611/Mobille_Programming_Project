import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item_Order extends StatefulWidget {
   Item_Order({super.key,required this.order});
  Order order;
  @override
  State<Item_Order> createState() => _Item_OrderState();
}

class _Item_OrderState extends State<Item_Order> {
   ProductPresenter proPre = ProductPresenter();
  late Product product;
  void loaddata() async {
    product = await proPre.getProductByID(widget.order.id);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  @override
  Widget build(BuildContext context) {
    //double screenWidth=MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
        

        
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 227, 223, 222),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Trạng thái đơn hàng",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5,),
                            widget.order.Status==0?Text("Chờ xác nhận"):widget.order.Status==1?Text("Chờ giao hàng"):widget.order.Status==2?Text("Đã giao"):Text("Đã hủy"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Ngày tạo",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                             SizedBox(height: 5,),
                            Text(
                              '${widget.order.date.toString().split(" ")[0]}',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Tổng thanh toán",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                             SizedBox(height: 5,),
                            Text(
                              "7.000.000đ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      height: 0.5,
                      decoration: BoxDecoration(color: Colors.grey),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/img/laptop1.png',
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product.name}',
                              // softWrap: true,
                               maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                             SizedBox(height: 10,),
                            Row(
                              children: [
                                Text(
                                  '${product.price}',
                                  style: TextStyle(color: Colors.red),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Text("x1"),
                              ],
                            ),
                             SizedBox(height: 15,),
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text("Xem sản phẩm")),
                                SizedBox(
                                  width: 30,
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Hủy đơn",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) => Color.fromARGB(
                                                  255, 224, 84, 75))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}
