import 'package:flutter/material.dart';

import '../../models/category.dart';
import '../../presenters/category_presenter.dart';
import 'content_section/content_section.dart';

class ContentSectionList extends StatefulWidget {
  const ContentSectionList({super.key});

  @override
  State<ContentSectionList> createState() => _ContentSectionListState();
}

class _ContentSectionListState extends State<ContentSectionList> {
  List<ContentSection> contentLst = List.filled(
      0, ContentSection(cate: Category(id: 0, nameCate: "")),
      growable: true);

  Future<void> loadData() async {
    List<Category> cateLst =
        List.filled(0, Category(id: 0, nameCate: "nameCate"), growable: true);
    CategoryPresenter catePre = CategoryPresenter();
    cateLst = await catePre.getCateLst();

    for (var item in cateLst) {
      contentLst.add(ContentSection(cate: item));
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
    return SizedBox(
      child: Column(
        children: contentLst,
      ),
    );
  }
}
