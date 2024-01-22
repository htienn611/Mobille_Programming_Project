import 'dart:ui';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/views/order/itemOrderDetail.dart';
import 'package:flutter/material.dart';
class  Order_Detail extends StatefulWidget {
  Order_Detail({super.key, required this.idOrder});
  int idOrder;

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

class _Order_DetailState extends State<Order_Detail> {
  final OrderPresenter _orderPre = OrderPresenter();
  final OrderDetailPresenter orderDetailPre = OrderDetailPresenter();
  List<OrderDetail> _orderDetail=List.filled(0, OrderDetail(0, 0, 0),growable: true);
  late Order order;
  void loadData() async {
    order = await _orderPre.getOrderByID(widget.idOrder);
    _orderDetail = await orderDetailPre.getListOrderDetailByID(widget.idOrder);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_double_arrow_left_rounded),
          ),
          title: Text("Thông tin đơn hàng"),
          backgroundColor: Color.fromARGB(255, 224, 84, 75),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                margin: EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (Color.fromARGB(255, 246, 212, 210)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.location_on_outlined),
                        Text(
                          "Địa chỉ nhận hàng",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        order.Status == 0
                            ? Text("Chờ xác nhận")
                            : order.Status == 1
                                ? Text("Chờ giao hàng")
                                : order.Status == 2
                                    ? Text("Đã giao")
                                    : Text("Đã hủy"),
                      ],
                    ),
                    Padding(padding: EdgeInsets.all(5.0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("Tên người nhận:",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                            Text("Nhu y"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Số điện thoại:",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                            Text("Nhu y"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Địa chỉ:",style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                            Text(''),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Mã đơn hàng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.idOrder.toString(),
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ngày đặt hàng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text('${order.date.toString().split(" ")[0]}',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 0.5,
                decoration: BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Column(
                children: [ItemOrderDetail(idOrder: widget.idOrder)],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tổng tiền hàng: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "38.440.000đ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Phí vận chuyển: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${order.transportFee}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Giảm giá: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "0đ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Thành tiền: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "38.440.000đ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        vertical: BorderSide.none)),
                child: Row(
                  children: [
                    Icon(Icons.money_outlined, color: Colors.red),
                    Padding(padding: EdgeInsets.all(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phương thức thanh toán",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        order.paymentMethods == 1
                            ? Text(
                                "Thanh toán tiền mặt",
                                style: TextStyle(color: Colors.grey),
                              )
                            : Text(
                                "Thanh toán bằng phương thức khác",
                                style: TextStyle(color: Colors.grey),
                              )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
