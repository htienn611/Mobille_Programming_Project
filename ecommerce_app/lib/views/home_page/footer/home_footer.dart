import 'package:ecommerce_app/views/home_page/footer/home_footer_cat.dart';
import 'package:flutter/material.dart';

class HomeFooter extends StatefulWidget {
  const HomeFooter({super.key});

  @override
  State<HomeFooter> createState() => _HomeFooterState();
}

class _HomeFooterState extends State<HomeFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 40),
      margin: const EdgeInsets.only(top: 5),
      child: Column(children: [
        HomeFooterCat(title: "VỀ CHÚNG TÔI"),
        HomeFooterCat(title: "CHÍNH SÁCH"),
        HomeFooterCat(title: "THÔNG TIN"),
        HomeFooterCat(title: "TỔNG ĐÀI HỖ TRỢ"),
        HomeFooterCat(title: "CÁCH THỨC TOÁN TOÁN"),
        HomeFooterCat(title: "KẾT NỐI VỚI CHÚNG TÔI",isConnect: true,),
      ]),
    );
  }
}
