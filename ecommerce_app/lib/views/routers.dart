import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/home_page.dart';
import 'package:ecommerce_app/views/order/listOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Routers extends StatefulWidget {
  const Routers({super.key});

  @override
  State<Routers> createState() => _RouterState();
}

class _RouterState extends State<Routers> {
  final ScrollController scrollController = ScrollController();
  bool _isVisible = true;
  var _currentIndex = 0;
  void navigation(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  late List<Widget> _pages;
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
    _pages = [
      HomePageScreen(scrollController: scrollController),
      const Center(
        child: Text("Danh Mục"),
      ),
      const Center(
        child: Text("Thông Báo"),
      ),
      const ListOrder(),
      const Center(
        child: Text("Tài Khoản"),
      )
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
}
