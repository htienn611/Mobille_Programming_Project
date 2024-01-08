import 'package:ecommerce_app/views/Oder/itemOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class listOrder extends StatefulWidget {
  const listOrder({super.key});

  @override
  State<listOrder> createState() => _listOrderState();
}

class _listOrderState extends State<listOrder> {
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
      ListView.builder(itemCount: 6,itemBuilder: (context, index) {
        return Column(
          children: [
            itemOrder(),
          ],
        );
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