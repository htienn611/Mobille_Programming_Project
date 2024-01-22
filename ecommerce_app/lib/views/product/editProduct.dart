import 'package:ecommerce_app/models/brand.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/promotion.dart';
import 'package:ecommerce_app/presenters/brand_presenter.dart';
import 'package:ecommerce_app/presenters/category_presenter.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/presenters/promotion_presenter.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  final Product sanpham;
  const EditProduct({super.key, required this.sanpham});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController desController = TextEditingController();
  List<Category> danhSachDanhMuc = [];
  CategoryPresenter catePre = CategoryPresenter();
  List<Brand> danhSachNhanHang = [];
  BrandPresenter brandPre = BrandPresenter();
  List<Promotion> danhSachGiamGia = [];
  PromotionPresenter promotionPre = PromotionPresenter();
  ProductPresenter proPre = ProductPresenter();
  bool checkUpdateProduct = false;

  Future<void> loadData() async {
    danhSachDanhMuc = await catePre.getCateLst();
    danhSachNhanHang = await brandPre.getBrandLst();
    danhSachGiamGia = await promotionPre.getPromotionLst();
    nameController.text = widget.sanpham.name;
    priceController.text = widget.sanpham.price.toString();
    quantityController.text = widget.sanpham.quantity.toString();
    desController.text = widget.sanpham.des;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void showMessSnackBar(String mess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mess),
        duration: const Duration(seconds: 2), // Đặt thời gian hiển thị
      ),
    );
  }

  void showErrMessSnackBar(String mess) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cảnh báo'),
          content: Text(mess),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Đóng thông báo
              },
              child: Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  void _editProduct(BuildContext context, Product pro) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: MediaQuery.of(context).size.height - 100,
              child: Column(children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(75),
                        child: const Image(
                          image: AssetImage('assets/img/laptop/laptop.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.grey,
                            ),
                            onPressed: () {},
                          ),
                        ))
                  ],
                ),
                TextField(
                  maxLength: 28,
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: "Tên sản phẩm"),
                ),
                TextField(
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Giá"),
                ),
                TextField(
                  controller: quantityController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Số lượng"),
                ),
                TextField(
                  maxLines: 4,
                  controller: desController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: "Mô tả"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DropdownButton<int>(
                        menuMaxHeight: 150,
                        value: pro.idCate,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        onChanged: (int? newValue) {
                          setState(() {
                            pro.idCate = newValue!;
                          });
                        },
                        items: danhSachDanhMuc.map((motDanhMuc) {
                          return DropdownMenuItem<int>(
                              value: motDanhMuc.id,
                              child: Text(motDanhMuc.nameCate.toString()));
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        menuMaxHeight: 150,
                        value: pro.idBrand,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        onChanged: (int? newValue) {
                          setState(() {
                            pro.idBrand = newValue!;
                          });
                        },
                        items: danhSachNhanHang.map((motNhanHang) {
                          return DropdownMenuItem<int>(
                              value: motNhanHang.id,
                              child: Text(motNhanHang.name.toString()));
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        menuMaxHeight: 150,
                        value: pro.idDiscount,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        onChanged: (int? newValue) {
                          setState(() {
                            pro.idDiscount = newValue!;
                          });
                        },
                        items: danhSachGiamGia.map((motGiamGia) {
                          return DropdownMenuItem<int>(
                              value: motGiamGia.id,
                              child: Text(motGiamGia.title.toString()));
                        }).toList(),
                      )
                    ]),
                ElevatedButton(
                  onPressed: () async {
                    if (nameController.text.isEmpty ||
                        quantityController.text.isEmpty ||
                        priceController.text.isEmpty ||
                        desController.text.isEmpty) {
                      showErrMessSnackBar(
                          "Xin hãy nhập thông tin đầy đủ trước khi thêm");
                    } else {
                      Product newP = Product(
                          id: pro.id,
                          image: pro.image,
                          name: nameController.text,
                          quantity: int.parse(quantityController.text),
                          price: int.parse(priceController.text),
                          des: desController.text,
                          idDiscount: pro.idDiscount,
                          status: 1,
                          idCate: pro.idCate,
                          idBrand: pro.idBrand);
                      checkUpdateProduct =
                          await proPre.updateProductPresenter(newP);
                      Navigator.pop(context);
                      if (checkUpdateProduct) {
                        showMessSnackBar('Cập nhật sản phẩm thành công');
                        setState(() {});
                      } else
                        showMessSnackBar('Cập nhật sản phẩm thất bại');
                    }
                    setState(() {});
                  },
                  child: const Text("Lưu"),
                ),
              ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _editProduct(context, widget.sanpham);
        },
        icon: const Icon(Icons.edit));
  }
}
