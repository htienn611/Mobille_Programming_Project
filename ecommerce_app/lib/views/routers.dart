import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/notification/notification.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:ecommerce_app/views/product/productManagement.dart';
import 'package:ecommerce_app/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../presenters/user_presenter.dart';

class Routers extends StatefulWidget {
  const Routers({super.key});

  @override
  State<Routers> createState() => _RouterState();
}

class _RouterState extends State<Routers> implements UserView {
  final ScrollController scrollController = ScrollController();
  bool _isVisible = true;
  String phoneNumber = '';
  var _currentIndex = 0;

  List<Widget> _pages = [
    const Center(
      child: Text("loading..."),
    )
  ];

  Future<void> statusLG() async {
    UserPresenter userPresenter = UserPresenter(this);
    // ignore: unrelated_type_equality_checks

//    if (userPresenter.getLoginStatus() == true) {
    phoneNumber = await userPresenter.getSavedPhoneNumber();
    //  }
  }

  @override
  void initState() {
    super.initState();
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
    statusLG().then((value) {
      _pages.clear();
      // ignore: avoid_print
      print('routers: $phoneNumber');
      _pages = [
        HomePageScreen(
            scrollController: scrollController, phoneNumber: phoneNumber),
        const ProductManagement(),
        NotificationScreen(phoneNumber: phoneNumber),
        const ListOrder(),
        Profile(phoneNumber: phoneNumber),
      ];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _isVisible
          ? BottomNav(onTabTapped: (index) async {
              if (index == 4) {
                if (phoneNumber == '') {
                  _pages.clear();
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                  UserPresenter userPresenter = UserPresenter(this);
                  phoneNumber = await userPresenter.getSavedPhoneNumber();
                  _pages = [
                    HomePageScreen(
                      scrollController: scrollController,
                      phoneNumber: phoneNumber,
                    ),
                    const ProductManagement(),
                    NotificationScreen(phoneNumber: phoneNumber),
                    const ListOrder(),
                    Profile(phoneNumber: phoneNumber),
                  ];
                }
              }
              _currentIndex = index;
              setState(() {});
            })
          : const SizedBox(),
    );
  }

  @override
  void displayMessage(String message) {}
}
