//import 'package:ecommerce_app/models/cart_detail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/product/ratingStar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  //final CartDetail cartDetail;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Colors.transparent, // Để thanh điều hướng ở dưới trong suốt
        systemNavigationBarIconBrightness:
            Brightness.light, // Màu icon trên thanh điều hướng
        statusBarColor:
            Colors.transparent, // Để thanh trạng thái ở trên trong suốt
        statusBarIconBrightness:
            Brightness.light, // Màu icon trên thanh trạng thái
      ),
    );
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent, // Đặt màu trong suốt
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(
                    25.0), // Điều chỉnh giá trị này để chỉnh bo góc dưới bên trái
                bottomRight: Radius.circular(
                    25.0), // Điều chỉnh giá trị này để chỉnh bo góc dưới bên phải
              ),
              child: Image.asset(
                'assets/img/laptop/laptop.jpg',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width - 50,
              ),
            ),
            Container(
                child: Column(children: [
              Text(widget.product.name,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              const RatingStar(),
              Text(
                "${NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0).format(widget.product.price)} vnđ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
              Text("Số lượng: ${widget.product.quantity.toString()}"),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.product.des,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ])),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  children: [
                    Text(
                      "Trúc Trần",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Rất tuyệt")
                  ],
                ),
                const SizedBox(
                  width: 200,
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.greenAccent,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  children: [
                    Text(
                      "Chương Phú",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Very good")
                  ],
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.pink,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  children: [
                    Text(
                      "Lee Do Huyn",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("Chạy mượt ")
                  ],
                ),
              ]),
            )
          ],
        )),
        bottomNavigationBar: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(185, 233, 30, 33),
                  ),
                  child: const Center(
                      child: Icon(Icons.chat,color: Colors.white,)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(185, 233, 30, 33),
                  ),
                  child: const Center(
                      child: Text(
                    "Thêm vào giỏ",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  // if (widget.product.id == widget.cartDetail.idProduct) {
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //   SnackBar(
                  //   content: Text('Sản phẩm đã có trong giỏ hàng'),
                  //   duration: const Duration(seconds: 2),
                  //   ),
                  // );
                  // } else {
                  //   CartDetail newCartD = CartDetail(
                  //       id: .id,
                  //       image: pro.image,
                  //       quantity: int.parse(quantityController.text),
                  //   checkUpdateProduct =
                  //       await proPre.updateProductPresenter(newP);
                  //   Navigator.pop(context);
                  //   if (checkUpdateProduct) {
                  //     showMessSnackBar('Cập nhật sản phẩm thành công');
                  //     setState(() {});
                  //   } else
                  //     showMessSnackBar('Cập nhật sản phẩm thất bại');
                  },
                
                child: Container(
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(185, 233, 30, 33),
                  ),
                  child: const Center(
                      child: Text(
                    "Mua ngay",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
