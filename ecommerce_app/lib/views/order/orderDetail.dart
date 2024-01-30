// ignore: file_names
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/order/itemOrderDetail.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class Order_Detail extends StatefulWidget {
  Order_Detail({super.key, required this.idOrder});
  int idOrder;

  @override
  State<Order_Detail> createState() => _Order_DetailState();
}

// ignore: camel_case_types
class _Order_DetailState extends State<Order_Detail> {
  double sumMoney = 0;
  final OrderPresenter _orderPre = OrderPresenter();
  ProductPresenter proPre = ProductPresenter();
  final OrderDetailPresenter orderDetailPre = OrderDetailPresenter();
  late Order order;
  late OrderDetail _orderDetail;

  List<Product> _product = List.filled(
      0,
      Product(
          id: 0,
          image: "",
          name: "",
          quantity: 0,
          price: 0,
          des: "",
          idDiscount: 0,
          status: 0,
          idCate: 0,
          idBrand: 0));

  void loadData() async {
    order = await _orderPre.getOrderByID(widget.idOrder);
    _product = await proPre.getInfoProductByIdOrderDetail(widget.idOrder);
    _orderDetail = await orderDetailPre.getOrderDetailByID(widget.idOrder);

    //sumMoney=_product.fold(0, (sum,product) { return sum+(product.price*_orderDetail.quantityProduct);});

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    //  print(user.name);
    //  print(order.phoneNumber);
    //  print("Aaa");
    return Scaffold(
        appBar: AppBar(
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
          ),
          title: Text(
            "Thông tin đơn hàng",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                margin: const EdgeInsets.only(
                    top: 15, left: 5, right: 5, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: (const Color.fromARGB(255, 246, 212, 210)))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.location_on_outlined),
                        const Text(
                          "Địa chỉ nhận hàng",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ),
                        order.Status == 0
                            ? const Text("Chờ xác nhận")
                            : order.Status == 1
                                ? const Text("Chờ giao hàng")
                                : order.Status == 2
                                    ? const Text("Đã giao")
                                    : const Text("Đã hủy"),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(5.0)),
                    Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Số điện thoại:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            // ignore: unnecessary_string_interpolations
                            Text('${order.phoneNumber}'),
                          ],
                        ),
                        Row(
                          children: [
                            const Text(
                              "Địa chỉ:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            // ignore: unnecessary_string_interpolations
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              constraints: BoxConstraints(
                                maxWidth: MediaQuery.of(context).size.width-115,
                              ),
                              child: Text(
                                // ignore: unnecessary_string_interpolations
                                '${order.address}',softWrap: true, maxLines: null,
                              ),
                            ),
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
                      const Text(
                        "Mã đơn hàng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(widget.idOrder.toString(),
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Ngày đặt hàng",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      // ignore: unnecessary_string_interpolations
                      Text('${order.date.toString().split(" ")[0]}',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                height: 0.5,
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              Column(
                children: [
                  ItemOrderDetail(
                    idOrder: widget.idOrder,
                    sum: sum,
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(20),
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
                          '${sumMoney.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phí vận chuyển: ",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${order.transportFee}',
                          style: const TextStyle(
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
                          '${sumMoney + order.transportFee}',
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
                        horizontal: BorderSide(
                            color: Color.fromARGB(255, 243, 243, 243)),
                        vertical: BorderSide.none)),
                child: Row(
                  children: [
                    const Icon(Icons.money_outlined, color: Colors.red),
                    const Padding(padding: EdgeInsets.all(10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phương thức thanh toán",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                        order.paymentMethods == 1
                            ? const Text(
                                "Thanh toán tiền mặt",
                                style: TextStyle(color: Colors.grey),
                              )
                            : const Text(
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

  void sum(double rs) {
    sumMoney = rs;
    setState(() {});
  }
}
