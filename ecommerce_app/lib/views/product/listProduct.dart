import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/product/deleteProduct.dart';
import 'package:ecommerce_app/views/product/editProduct.dart';
import 'package:ecommerce_app/views/product/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key, this.idCate=0});
  final idCate;
  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<Product> danhSachSanPham = [];
  ProductPresenter proPresenter = ProductPresenter();
  Future<void> loadData() async {
    danhSachSanPham.clear();
    danhSachSanPham = await proPresenter.getProduct();
  }

  @override
  void initState() {
    super.initState();
    loadData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: widget.idCate==0?danhSachSanPham.length:danhSachSanPham.where((element) => element.idCate==widget.idCate).toList().length,
        itemBuilder: (context, index) {
          Product sanPham =widget.idCate==0?danhSachSanPham[index]:danhSachSanPham.where((element) => element.idCate==widget.idCate).toList()[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetail(
                          product: sanPham,
                        )),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(50, 158, 158, 158),
                      width: 1,
                      style: BorderStyle.solid)),
              width: MediaQuery.of(context).size.width,
              height: 150,
              padding: const EdgeInsets.all(10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            'assets/img/laptop.png',
                            fit: BoxFit.cover,
                            width: 120,
                            height: 120,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          sanPham.name.toString(),
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                          softWrap: true,
                        ),
                        Text(
                          "${NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0).format(sanPham.price)} vnđ",
                        ),
                        Text("Số lượng: ${sanPham.quantity.toString()}")
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        EditProduct(sanpham: sanPham),
                        DeleteProduct(sanpham: sanPham)
                      ],
                    )
                  ]),
            ),
          );
        });
  }
}
