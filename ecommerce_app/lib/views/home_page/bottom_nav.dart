import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.red, width: 1))),
          child: BottomNavigationBar(
            onTap: (index){},
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "Trang chủ"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined), label: "Danh mục"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_outlined),
                  label: "Thông báo"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.content_paste), label: "Đơn hàng"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_outlined),
                  label: "Tài khoản"),
            ],
            currentIndex: 0,
            selectedItemColor: const Color.fromARGB(255, 224, 84, 75),
            selectedLabelStyle:
                const TextStyle(color: Color.fromARGB(255, 224, 84, 75)),
            unselectedItemColor: Colors.black,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            showUnselectedLabels: true,
          ),
        );
  }
}