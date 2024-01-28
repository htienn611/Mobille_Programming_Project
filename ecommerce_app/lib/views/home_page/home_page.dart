import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:ecommerce_app/views/chat/convItem.dart';
import 'package:ecommerce_app/views/home_page/content_list.dart';
import 'package:ecommerce_app/views/home_page/content_section/content_section.dart';
import 'package:ecommerce_app/views/home_page/home_appbar_items.dart';
import 'package:ecommerce_app/views/home_page/footer/home_footer.dart';
import 'package:ecommerce_app/views/home_page/promotion_banner.dart';
import 'package:ecommerce_app/views/login.dart';
import 'package:ecommerce_app/views/routers.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen(
      {super.key, required this.scrollController, required this.phoneNumber});
  final ScrollController scrollController;
  final String phoneNumber;
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print('phone:${widget.phoneNumber}');
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          actions: [
            HomePageAppbarItem(
              phone: widget.phoneNumber,
            )
          ],
        ),
        body: SingleChildScrollView(
          controller: widget.scrollController,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //const CategoriesBar(),
              Container(
                margin: const EdgeInsets.only(bottom: 6),
                color: Colors.grey[300],
                child: Column(children: [
                  const PromotionBanner(),
                  //ngọc trúc thêm tham số stutus còn thiếu vào dòng 70 vì do thay đổi ở csdl sửa để kh bị lỗi
                  ContentSection(
                    isBestSelling: true,
                    cate: Category(id: 0, nameCate: "", status: 0),
                  ),
                  const ContentSectionList(),
                  const HomeFooter()
                ]),
              ),
            ],
          )),
        ),
        floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: FloatingActionButton(
              onPressed: () {
                if (widget.phoneNumber.isEmpty) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      )).then((value) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Routers(),
                        ));
                  });
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              widget.phoneNumber == "0949866367"
                                  ? ConvList(admin: widget.phoneNumber)
                                  : ChatScreen(
                                      phoneNumber: widget.phoneNumber,
                                    )));
                }
              },
              child: const Image(
                image: AssetImage('assets/img/chat.png'),
              )),
        ));
  }
}
