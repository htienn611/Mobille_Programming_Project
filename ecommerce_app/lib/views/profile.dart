import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(width: MediaQuery.of(context).size.width,child: Text("THÔNG TIN CÁ NHÂN", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:80),
            Center(child: ClipRRect(borderRadius: BorderRadius.circular(100),child: Image(fit: BoxFit.cover,image: AssetImage('assets/anh.jpg'),width: 200, height: 200,)), ),
            SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Tên",suffixIcon: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios)), 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Giới tính",suffixIcon: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios)), 
                border: OutlineInputBorder(),enabled: false),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Ngày sinh",suffixIcon: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios)), 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "SĐT",suffixIcon: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios)), 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Tiểu sử",suffixIcon: IconButton(onPressed: (){}, icon:Icon( Icons.arrow_forward_ios)), 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
        ])));
  }
}