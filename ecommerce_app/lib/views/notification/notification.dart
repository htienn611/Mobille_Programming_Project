import 'package:ecommerce_app/presenters/noti_presenter.dart';
import 'package:ecommerce_app/views/notification/notification_item.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key,required this.phoneNumber});
  final phoneNumber;
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  List Noti=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNoti();
  }
  void loadNoti() async{
    Noti=await Notification_Presenter().getNotiByPhoneNumber(widget.phoneNumber);
setState(() {
  
});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        backgroundColor: Colors.redAccent,
        title: Container(width: MediaQuery.of(context).size.width,child: Text("THÔNG BÁO", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.fromLTRB(10, 15, 0, 10),
              child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                children: [
                  Icon(Icons.local_offer_outlined),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Khuyến mãi",style: TextStyle(fontSize: 20),),
                        Text("Laptop chính hãng khuyễn mãi đến 10%")
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SizedBox(width: 10,),
                Text("Cập nhật đơn hàng"),
Expanded(child: Text("")),
                Text("Đọc tất cả"),
                SizedBox(width: 10,)
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: 
              ListView.builder(itemCount: Noti.length,itemBuilder: (context, index) => Notification_Item(content: Noti[index].content),),
            )
          ],
        ),
      ),
    );
  }
}