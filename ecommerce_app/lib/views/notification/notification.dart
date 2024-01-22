import 'package:ecommerce_app/views/notification/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: SizedBox(width: MediaQuery.of(context).size.width,child: const Text("THÔNG BÁO", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: const EdgeInsets.fromLTRB(10, 15, 0, 10),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: [
                  const Icon(Icons.local_offer_outlined),
                  const SizedBox(width: 10,),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Khuyến mãi",style: TextStyle(fontSize: 20),),
                        Text("Laptop chính hãng khuyễn mãi đến 10%")
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            const SizedBox(height: 40,),
            const Row(
              children: [
                SizedBox(width: 10,),
                Text("Cập nhật đơn hàng"),
Expanded(child: Text("")),
                Text("Đọc tất cả"),
                SizedBox(width: 10,)
              ],
            ),
            const SizedBox(height: 20,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
            const Notification_Item(),
            const SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}