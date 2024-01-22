import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/content_list.dart';
import 'package:ecommerce_app/views/home_page/content_section/content_section.dart';
import 'package:ecommerce_app/views/home_page/home_appbar_items.dart';
import 'package:ecommerce_app/views/home_page/footer/home_footer.dart';
import 'package:ecommerce_app/views/home_page/promotion_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // Người dùng đang cuộn lên trên, ẩn BottomNavigationBar
        if (_isVisible) {
          setState(() {
            _isVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // Người dùng đang cuộn xuống dưới, hiển thị BottomNavigationBar
        if (!_isVisible) {
          setState(() {
            _isVisible = true;
          });
        }
      }
    });
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
          controller: _scrollController,
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
                  ContentSection(
                    isBestSelling: true,
                    cate: Category(id: 0, nameCate: ""),
                  ),
                  const ContentSectionList(),
                  const HomeFooter()
                ]),
              ),
            ],
          )),
        ),
        bottomNavigationBar: _isVisible ? const BottomNav() : const SizedBox(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage('assets/img/chat.png'),
            ),
          ),
        ));
  }
}
