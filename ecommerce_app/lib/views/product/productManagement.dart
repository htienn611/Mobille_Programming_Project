import 'dart:io';

import 'package:ecommerce_app/models/brand.dart';
import 'package:ecommerce_app/views/product/listProduct.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/models/category.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  String dropDownValue = "Laptop";
  String dropDownValueBrand = "Del";
  late ImagePicker _picker;
  late XFile _image;
  List<Category> danhSachDanhMuc = [];
  void loadData() async {
    List<Category> danhMuc = await Category.getCateLst();
    setState(() {
      danhSachDanhMuc = danhMuc;
    });
  }

  List<Brand> danhSachNhanHang = [];
  void loadDataBrand() async {
    List<Brand> nhanHang = await Brand.getBrandLst();
    setState(() {
      danhSachNhanHang = nhanHang;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
    loadDataBrand();
    _picker = ImagePicker();
    _image = XFile("");
  }

  Future<void> _pickImage() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = pickedImage;
      });
    }
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
                      child: _image != null
                          ? Image.file(
                              File(_image.path),
                              fit: BoxFit.cover,
                            )
                          : Image(
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
                          onPressed: () {
                            _image = 'assets/img/laptop/laptop.jpg' as XFile;
                            _pickImage();
                          },
                        ),
                      ))
                ],
              ),
              TextField(
                decoration: InputDecoration(hintText: "Tên sản phẩm"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Giá"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Giảm giá"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Số lượng"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "Mô tả"),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                DropdownButton<String>(
                  value: dropDownValue,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValue = newValue!;
                      print(dropDownValue);
                    });
                  },
                  items: danhSachDanhMuc.map((motDanhMuc) {
                    return DropdownMenuItem<String>(
                        value: motDanhMuc.nameCate.toString(),
                        child: Text(motDanhMuc.nameCate.toString()));
                  }).toList(),
                ),
                DropdownButton<String>(
                  value: dropDownValueBrand,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropDownValueBrand = newValue!;
                      print(dropDownValueBrand);
                    });
                  },
                  items: danhSachNhanHang.map((motNhanHang) {
                    return DropdownMenuItem<String>(
                        value: motNhanHang.name.toString(),
                        child: Text(motNhanHang.name.toString()));
                  }).toList(),
                )
              ]),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
