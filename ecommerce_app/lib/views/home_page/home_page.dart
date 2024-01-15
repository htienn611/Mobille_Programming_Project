import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/categories_bar.dart';
import 'package:ecommerce_app/views/home_page/content_section/content_section.dart';
import 'package:ecommerce_app/views/home_page/drawer_home_page.dart';
import 'package:ecommerce_app/views/home_page/home_appbar_items.dart';
import 'package:ecommerce_app/views/home_page/footer/home_footer.dart';
import 'package:ecommerce_app/views/home_page/promotion_banner.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    // var sW = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          actions: const [HomePageAppbarItem()],
        ),
        drawer: const DrawerHomePage(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CategoriesBar(),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                color: Colors.grey[300],
                child: Column(children: const [
                  PromotionBanner(),
                  ContenSection(
                    isBestSeller: true,
                  ),
                  ContenSection(),
                  HomeFooter()
                ]),
              ),
            ],
          )),
        ),
        bottomNavigationBar: const BottomNav(),
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
