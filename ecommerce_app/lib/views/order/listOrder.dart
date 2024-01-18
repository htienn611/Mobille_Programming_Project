import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/views/order/itemOrder.dart';
import 'package:ecommerce_app/views/order/order_item.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({super.key});
  @override
  State<ListOrder> createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  final OrderPresenter _orderPresenter=OrderPresenter();
  List<Order>_orders=List.filled(0, Order(0, 0, 0, "", DateTime.now(), 0),growable: true);
  
   void _loadData() async
  {
    _orders=await _orderPresenter.getlstOrder();
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 5, child: Scaffold(appBar: AppBar(
      leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back,)),
      backgroundColor: Color.fromARGB(255, 224, 84, 75),
      toolbarHeight: 30,
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))

      ],
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
      ),
      bottom: TabBar(tabs: 
      [
        Tab(text: 'Tất cả',),
        Tab(text: 'Chờ xác nhận',),
        Tab(text: 'Chờ giao hàng',),
        Tab(text: 'Đã giao',),
        Tab(text: 'Đã hủy',),

      ],
      indicatorColor: Colors.white,
      isScrollable: true,

   
        
      ),
    ),
    body: TabBarView(children: [
      // ListView.builder(itemCount: _orders.length,itemBuilder: (context, index) {
      //   return ItemOrder(order: _orders[index]);
      // }
      // ),
      
      ListView.builder(itemCount: _orders.length,itemBuilder: (context, index) {
        return Item_Order(order: _orders[index],);
      },),
      Center(
        child: Text("Các đơn hàng chờ xác nhận"),
      ),
      Center(
        child: Text("Các đơn hàng chờ giao"),
      ),
      Center(
        child: Text("Các đơn hàng đã giao"),
      ),
       Center(
        child: Text("Các đơn hàng đã hủy"),
      ),

    ]),
    ),
    );
  }
}