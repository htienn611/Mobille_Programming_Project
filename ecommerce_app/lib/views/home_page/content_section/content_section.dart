import 'package:ecommerce_app/models/brand.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/brand_presenter.dart';
import 'package:ecommerce_app/presenters/category_presenter.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/home_page/content_section/sub_cat_label.dart';
import 'package:flutter/material.dart';
import 'product_label.dart';

class ContentSection extends StatefulWidget {
  const ContentSection(
      {super.key, this.isBestSelling = false, required this.cate});
  final bool isBestSelling;
  final Category cate;
  @override
  State<ContentSection> createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<SubCatLabel> subCatItems = List.filled(
      0, SubCatLabel(object: "", reLoadProduct: () {}),
      growable: true);
  List<ProductLabel> productsLabel = List.filled(
      0,
      ProductLabel(
          product: Product(
              id: 0,
              image: "image",
              name: "name",
              quantity: 0,
              price: 0,
              des: "des",
              idDiscount: 0,
              status: 0,
              idCate: 0,
              idBrand: 0)),
      growable: true);

  Future<void> loadProducts(limit, idCate, idBrand) async {
    List<Product> products = List.filled(
        0,
        Product(
            id: 0,
            image: "image",
            name: "name",
            quantity: 0,
            price: 0,
            des: "des",
            idDiscount: 0,
            status: 0,
            idCate: 0,
            idBrand: 0),
        growable: true);

    ProductPresenter proPre = ProductPresenter();

    products = widget.isBestSelling
        ? await proPre.getBestSellingProducts(limit, idCate)
        : await proPre.getProductsByIdCateIdBrand(limit, idCate, idBrand);
      productsLabel.clear();
      for (var item in products) {
        productsLabel.add(ProductLabel(
          product: item,
        ));
      }
    setState(() {});
  }

  Future<void> loadData() async {
    List<dynamic> subLst = List.filled(0, "", growable: true);
    //load sub cate data
    if (widget.isBestSelling) {
      CategoryPresenter catePre = CategoryPresenter();
      subLst = await catePre.getCateLst();
    } else {
      if (widget.cate.id != 0) {
        BrandPresenter brandPre = BrandPresenter();
        subLst = await brandPre.getBrandLstByCate(widget.cate.id);
      }
    }
    if (subLst.isNotEmpty) {
      if (subLst[0] is Category) {
        for (Category item in subLst) {
          subCatItems.add(SubCatLabel(
            object: item,
            reLoadProduct: () => loadProducts(
              5,
              item.id,
              0,
            ),
          ));
        }
        loadProducts(5, (subLst[0] as Category).id, 0);
      } else {
        for (Brand item in subLst) {
          subCatItems.add(SubCatLabel(
            object: item,
            reLoadProduct: () => loadProducts(5, widget.cate.id, item.id),
          ));
        }
        loadProducts(5, widget.cate.id, (subLst[0] as Brand).id);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
    loadData().then((value) => {setState(() {})});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          margin: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
              color: widget.isBestSelling
                  ? const Color.fromARGB(255, 224, 84, 75)
                  : Colors.white),
          child: widget.isBestSelling
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Icon(
                          Icons.electric_bolt_sharp,
                          size: 30.0,
                          color: Colors.yellow.withOpacity(_controller.value),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'SALE KHỦNG',
                      style: TextStyle(fontSize: 20, color: Colors.yellow),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.cate.nameCate,
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("Xem tất cả"),
                      )
                    ],
                  ),
                ),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: subCatItems,
            )),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: productsLabel),
        ),
      ]),
    );
  }
}
