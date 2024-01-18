import 'package:ecommerce_app/models/brand.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/models/promotion.dart';
import 'package:ecommerce_app/presenters/brand_presenter.dart';
import 'package:ecommerce_app/presenters/category_presenter.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/presenters/promotion_presenter.dart';
import 'package:ecommerce_app/views/product/listProduct.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/category.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  //Khai báo biến
  int dropDownValueCate = 1;
  int dropDownValuePromotion = 1;
  int dropDownValueBrand = 5;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController desController = TextEditingController();
  List<Category> danhSachDanhMuc = [];
  CategoryPresenter catePre = CategoryPresenter();
  List<Brand> danhSachNhanHang = [];
  BrandPresenter brandPre = BrandPresenter();
  ProductPresenter proPre = ProductPresenter();
  bool checkAddProduct = false;
  List<Promotion> danhSachGiamGia = [];
  PromotionPresenter promotionPre = PromotionPresenter();

  void loadData() async {
    danhSachDanhMuc = await catePre.getCateLst();
    danhSachNhanHang = await brandPre.getBrandLst();
    danhSachGiamGia = await promotionPre.getPromotionLst();
    setState(() {});
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
        duration: Duration(seconds: 2), // Đặt thời gian hiển thị
      ),
    );
  }

  void _addProduct(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height - 200,
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
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Tên sản phẩm"),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Giá"),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Số lượng"),
              ),
              TextField(
                controller: desController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: "Mô tả"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                DropdownButton<int>(
                  value: dropDownValueCate,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (int? newValue) {
                    setState(() {
                      dropDownValueCate = newValue!;
                      print(dropDownValueCate);
                    });
                  },
                  items: danhSachDanhMuc.map((motDanhMuc) {
                    return DropdownMenuItem<int>(
                        value: motDanhMuc.id,
                        child: Text(motDanhMuc.nameCate.toString()));
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: dropDownValueBrand,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (int? newValue) {
                    setState(() {
                      dropDownValueBrand = newValue!;
                      print(dropDownValueBrand);
                    });
                  },
                  items: danhSachNhanHang.map((motNhanHang) {
                    return DropdownMenuItem<int>(
                        value: motNhanHang.id,
                        child: Text(motNhanHang.name.toString()));
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: dropDownValuePromotion,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (int? newValue) {
                    setState(() {
                      dropDownValuePromotion = newValue!;
                      print(dropDownValuePromotion);
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
                    showMessSnackBar(
                        "Xin hãy nhập thông tin đầy đủ trước khi thêm");
                  } else {
                    Product product = Product.AddProduct(
                        image: "image",
                        name: nameController.text,
                        quantity: int.parse(quantityController.text),
                        price: int.parse(priceController.text),
                        des: desController.text,
                        idDiscount: dropDownValuePromotion,
                        status: 1,
                        idCate: dropDownValueCate,
                        idBrand: dropDownValueBrand);

                    checkAddProduct = await proPre.addProductPresenter(product);
                    Navigator.pop(context);
                    if (checkAddProduct)
                      showMessSnackBar('Thêm sản phẩm thành công');
                    else
                      showMessSnackBar('Thêm sản phẩm thất bại');
                  }
                },
                child: Text("Lưu"),
              )
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(185, 233, 30, 33),
            leading: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            actions: [
              PopupMenuButton(
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                          child: ListTile(
                        title: Text("Thêm sản phẩm"),
                        onTap: () {
                          // xử lý thêm sản phẩm
                          Navigator.pop(context);
                          setState(() {
                            _addProduct(context);
                          });
                        },
                      )),
                      PopupMenuItem(
                          child: ListTile(
                        title: Text("Thêm danh mục"),
                        onTap: () {
                          // xử lý thêm sản phẩm
                        },
                      ))
                    ];
                  })
            ],
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                tabs: [
                  GestureDetector(
                    onLongPress: () {
                      _showMenu(context);
                    },
                    child: Text("Tất cả"),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _showMenu(context);
                    },
                    child: Text("Một"),
                  ),
                ]),
          ),
          body: const TabBarView(
            children: [
              // Nội dung tab mặc định
              ListProduct(),
              Center(
                child: Text('Laptop'),
              ),
            ],
          ),
        ));
  }
}

void _showMenu(BuildContext context) {
  // Hiển thị menu khi nhấn giữ lên tab
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(0, 100, 0, 0),
    items: [
      PopupMenuItem(
        child: ListTile(
          title: Icon(Icons.edit),
          onTap: () {
            print('Option 1 selected  ');
            Navigator.pop(context);
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          title: Icon(Icons.delete),
          onTap: () {
            Navigator.pop(context);
            _showDeleteConfirmation(context);
          },
        ),
      ),
    ],
  );
}

void _showDeleteConfirmation(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Xác nhận Xóa'),
        content: Text('Bạn có chắc chắn muốn xóa không?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Đóng thông báo
            },
            child: Text('Hủy'),
          ),
          TextButton(
            onPressed: () {
              // Thực hiện xóa dữ liệu
              Navigator.pop(context); // Đóng thông báo sau khi xử lý xóa
            },
            child: Text('Xóa'),
          ),
        ],
      );
    },
  );
}
