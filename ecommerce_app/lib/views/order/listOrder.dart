// ignore: file_names
import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/views/order/order_item.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({super.key});
  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  final OrderPresenter _orderPresenter = OrderPresenter();
  List<Order> _orders =
      List.filled(0, Order(0, 0, 0, "", DateTime.now(), 0, ""), growable: true);

  void _loadData() async {
    _orders = await _orderPresenter.getlstOrder();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    var style = const TextStyle(color: Colors.white, fontSize: 15);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back,
              )),
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          toolbarHeight: 30,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          bottom:  TabBar(
            labelStyle: style,
            unselectedLabelColor: Colors.white,
            tabs:const [
              Tab(
                text: 'Tất cả'
              ),
              Tab(
                text: 'Chờ xác nhận',
              ),
              Tab(
                text: 'Chờ giao hàng',
              ),
              Tab(
                text: 'Đã giao',
              ),
              Tab(
                text: 'Đã hủy',
              ),
            ],
            indicatorColor: Colors.white,
            isScrollable: true,
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
              itemCount: _orders.length,
              itemBuilder: (context, index) {
                return ItemOrder(order: _orders[index]);
              }),
          _orders.where((element) => element.Status == 0).toList().isNotEmpty
              ? ListView.builder(
                  itemCount: _orders
                      .where((element) => element.Status == 0)
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return ItemOrder(
                        order: _orders
                            .where((element) => element.Status == 0)
                            .toList()[index]);
                  })
              : const Center(
                  child: Text(
                    "Chưa có đơn hàng nào chờ xác nhận",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
          _orders.where((element) => element.Status == 1).toList().isNotEmpty
              ? ListView.builder(
                  itemCount: _orders
                      .where((element) => element.Status == 1)
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return ItemOrder(
                        order: _orders
                            .where((element) => element.Status == 1)
                            .toList()[index]);
                  })
              : const Center(
                  child: Text(
                    "Chưa có đơn hàng nào chờ giao",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
          _orders.where((element) => element.Status == 2).toList().isNotEmpty
              ? ListView.builder(
                  itemCount: _orders
                      .where((element) => element.Status == 2)
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return ItemOrder(
                        order: _orders
                            .where((element) => element.Status == 2)
                            .toList()[index]);
                  })
              : const Center(
                  child: Text(
                    "Chưa có đơn hàng nào đã giao",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
          _orders.where((element) => element.Status == 3).toList().isNotEmpty
              ? ListView.builder(
                  itemCount: _orders
                      .where((element) => element.Status == 3)
                      .toList()
                      .length,
                  itemBuilder: (context, index) {
                    return ItemOrder(
                        order: _orders
                            .where((element) => element.Status == 3)
                            .toList()[index]);
                  })
              : const Center(
                  child: Text(
                    "Chưa có đơn hàng nào đã hủy",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
        ]),
      ),
    );
  }
}
