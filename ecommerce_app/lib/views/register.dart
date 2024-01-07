import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(width: MediaQuery.of(context).size.width,child: Text("ĐĂNG KÝ", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:40),
            Center(child: Image(image: AssetImage('assets/logo.jpg'),width: 200, height: 200,), ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Họ và tên", 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Số điện thoại", 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Ngày sinh", 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: TextField(
                decoration: InputDecoration(labelText: "Mật khẩu", 
                border: OutlineInputBorder()),
                         ),
             ), SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: "Nhập lại mật khẩu", 
                border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 9,),
            ElevatedButton(onPressed: (){}, child: Text("Đăng ký", style: TextStyle(fontSize: 20),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent), padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20,10,20,10))),)
      
          ],
        ),
      ),

    );
  }
}