import 'package:ecommerce_app/views/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController phoneNumberController=TextEditingController();
  late TextEditingController passwordController=TextEditingController();
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
            SizedBox(height:50),
            Center(child: Image(image: AssetImage('assets/img/logo/logo.jpg'),width: 200, height: 200,), ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.all(12),
              child: TextField(
                 controller: phoneNumberController,
                decoration: InputDecoration(labelText: "Số điện thoại", 
                border: OutlineInputBorder()),
              ),
            ),

             Container(
              padding: EdgeInsets.all(12),
               child: TextField(
                 controller: passwordController,
              obscureText: true,
                decoration: InputDecoration(labelText: "Mật khẩu", 
                border: OutlineInputBorder()),
                         ),
             ), SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12,left: 12),

              child: ElevatedButton(onPressed: (){}, child: Text("Đăng nhập", style: TextStyle(fontSize: 20),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent), padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20,10,20,10))),),
            ),
            SizedBox(height: 8),
             Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: 12,left: 12),
               child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                         }, child: Text("Đăng ký", style: TextStyle(fontSize: 20),), style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.redAccent), padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(20,10,20,10))),),
             ),            
          ],
        ),
      ),

    );
  }
}