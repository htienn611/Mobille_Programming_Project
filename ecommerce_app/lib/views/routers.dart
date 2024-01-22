import 'dart:ffi';

import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/notification/notification.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../presenters/user_presenter.dart';

class Routers extends StatefulWidget {
  const Routers({super.key});

  @override
  State<Routers> createState() => _RouterState();
}

class _RouterState extends State<Routers> implements UserView{
  final ScrollController scrollController = ScrollController();
  bool _isVisible = true;
  bool isLog=false;
  String PhoneNumber='';
  var _currentIndex = 0;
  void navigation(value) {
    setState(() {
      _currentIndex = value;
    });
  }

   List<Widget> _pages=[];

   Future<void> statusLG()
   async
   {
    UserPresenter userPresenter = UserPresenter(this);
   // ignore: unrelated_type_equality_checks
   if(userPresenter.getLoginStatus()==true)
   {
    PhoneNumber= await userPresenter.getSavedPhoneNumber();
    isLog=true;
    setState(() {
      
    });
   }
   }

  @override
  void initState()  {
    super.initState();
    statusLG();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Người dùng đang cuộn lên trên, ẩn BottomNavigationBar
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      } else if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Người dùng đang cuộn xuống dưới, hiển thị BottomNavigationBar
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
    _pages = [
      HomePageScreen(scrollController: scrollController),
      const Center(
        child: Text("Danh Mục"),
      ),
      NotificationScreen(phoneNumber: PhoneNumber),
      const ListOrder(),
       isLog?
      Profile(phoneNumber: PhoneNumber):Login()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _isVisible
          ? BottomNav(onTabTapped: (index) {
              setState(() {
                _currentIndex = index;
              });
            })
          : const SizedBox(),
    );
  }
  
  @override
  void displayMessage(String message) {
    // TODO: implement displayMessage
  }
}
