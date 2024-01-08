import 'package:ecommerce_app/views/home_page/appbarItems.dart';
import 'package:ecommerce_app/views/home_page/bottom_nav.dart';
import 'package:ecommerce_app/views/home_page/categories_bar.dart';
import 'package:ecommerce_app/views/home_page/drawer_home_page.dart';
import 'package:ecommerce_app/views/home_page/product_label.dart';
import 'package:ecommerce_app/views/home_page/promotion_banner.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  Widget build(BuildContext context) {
    var sW = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 224, 84, 75),
          actions: const [AppbarItem()],
        ),
        drawer: const DrawerHomePage(),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CategoriesBar(),
              Container(
                color: Colors.grey[300],
                child: Column(children: [
                  const PromotionBanner(),
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 5),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 224, 84, 75)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    return Icon(
                                      Icons.electric_bolt_sharp,
                                      size: 30.0,
                                      color: Colors.yellow
                                          .withOpacity(_controller.value),
                                    );
                                  },
                                ),
                                const Text(
                                  'SALE KHỦNG',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.yellow),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Danh mục',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Danh mục',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Danh mục',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Danh mục',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    margin: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text('Danh mục',
                                        style: TextStyle(fontSize: 18)),
                                  ),
                                ],
                              )),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(children: const [
                              ProductLabel(),
                              ProductLabel(),
                              ProductLabel(),
                              ProductLabel(),
                            ]),
                          )
                        ]),
                  )
                ]),
              )
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
