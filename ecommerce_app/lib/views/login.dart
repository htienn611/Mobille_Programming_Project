import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Container(width: MediaQuery.of(context).size.width,child: Text("ĐĂNG NHẬP", style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:80),
            Center(child: Image(image: AssetImage('assets/logo.jpg'),width: 250, height: 250,), ),
            SizedBox(height: 50,),
            TextField(
              decoration: InputDecoration(labelText: "Số điện thoại", 
              border: OutlineInputBorder()),
            ),
            SizedBox(height: 50,),
             TextField(
              decoration: InputDecoration(labelText: "Mật khẩu", 
              border: OutlineInputBorder()),
            ), SizedBox(height: 50),
            ElevatedButton(onPressed: (){}, child: Text("Đăng nhập", style: TextStyle(fontSize: 20),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent), padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20,10,20,10))),)
      
          ],
        ),
      ),

    );
  }
}