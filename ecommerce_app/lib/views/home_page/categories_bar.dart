import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/presenters/category_presenter.dart';
import 'package:flutter/material.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({super.key});

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  CategoryPresenter catePre = CategoryPresenter();
  //ngọc trúc thêm tham số stutus còn thiếu vào dòng 16 vì do thay đổi ở csdl sửa để kh bị lỗi
  List<Category> cateLst =
      List.filled(0, Category(id: 0, nameCate: "",status: 0), growable: true);
  List<Widget> items = List.filled(0, const Text(""), growable: true);
  void loadData() async {
    cateLst = await catePre.getCateLst();
    for (var item in cateLst) {
      items.add(GestureDetector(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.all(5),
            child: Text(
              item.nameCate,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )),
      ));
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 224, 84, 75),
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: items),
      ),
    );
  }
}
