import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/views/chat/chat.dart';
import 'package:ecommerce_app/views/home_page/content_list.dart';
import 'package:ecommerce_app/views/home_page/content_section/content_section.dart';
import 'package:ecommerce_app/views/home_page/home_appbar_items.dart';
import 'package:ecommerce_app/views/home_page/footer/home_footer.dart';
import 'package:ecommerce_app/views/home_page/promotion_banner.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key, required this.scrollController});
  final ScrollController scrollController;
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
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          actions: const [HomePageAppbarItem()],
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()));
              },
              child: const Image(
                image: AssetImage('assets/img/chat.png'),
              )),
        ));
  }
}
