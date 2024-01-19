import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/product/deleteProduct.dart';
import 'package:ecommerce_app/views/product/editProduct.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});
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
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding:const EdgeInsets.all(5),
        itemCount: danhSachSanPham.length,
        itemBuilder: (context, index) {
          Product sanPham = danhSachSanPham[index];
          return Container(
            decoration:const BoxDecoration(
                color:  Color.fromARGB(255, 255, 243, 247),
                boxShadow: [
                  BoxShadow(
                    color:  Color.fromARGB(227, 252, 228, 236),
                    spreadRadius: 4,
                    blurRadius: 5,
                    offset: Offset(0, 1),
                  )
                ]),
            width: MediaQuery.of(context).size.width,
            height: 150,
            padding:const EdgeInsets.all(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/img/laptop/laptop.jpg',
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        sanPham.name.toString(),
                        style:const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                        softWrap: true,
                      ),
                      Text("${sanPham.price} vnđ"),
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
          );
        });
  }
}
