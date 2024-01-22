import 'package:ecommerce_app/models/order_detail.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/views/order/itemOrderDetail.dart';
import 'package:flutter/material.dart';

class orderDetail extends StatefulWidget {
  const orderDetail({super.key});

  @override
  State<orderDetail> createState() => _orderDetailState();
}

class _orderDetailState extends State<orderDetail> {
  final OrderDetailPresenter _orderdetailPresenter = OrderDetailPresenter();
  List<OrderDetail> _orderdetails =
      List.filled(0, OrderDetail(0, 0, 0), growable: true);
  void loadData() async {
    _orderdetails = await _orderdetailPresenter.getlstOrderDetail();
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
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
          ),
          title: const Text("Thông tin đơn hàng"),
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              margin: const EdgeInsets.only(top: 15, left: 5, right: 5, bottom: 10),
              decoration: BoxDecoration(
                  border:
                      Border.all(color: (const Color.fromARGB(255, 246, 212, 210)))),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text(
                        "Địa chỉ nhận hàng",
                        style: TextStyle(fontSize: 18, color: Colors.grey,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Đang giao hàng",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text("Tên người nhận: Nguyễn Ngọc Như Ý",
                      style: TextStyle(fontSize: 16)),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text("Số điện thoại: 0395060907",
                      style: TextStyle(fontSize: 16)),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text("Địa chỉ: 793/28Trần Xuân Soạn",
                      style: TextStyle(fontSize: 16))
                ],
              ),
            ),
         
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "Mã đơn hàng",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    Text("LT0123", style: TextStyle(color: Colors.grey)),
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
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                    Text("03/01/2024", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              height:0.5,
              decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: _orderdetails.length,
                itemBuilder: (context, index) {
                  return itemOrderDetail(oderDetail: _orderdetails[index]);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Column(
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
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(color: Color.fromARGB(255, 243, 243, 243)),
                      vertical: BorderSide.none)),
              child: const Row(
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
                      Text(
                        "Thanh toán khi nhận hàng",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
