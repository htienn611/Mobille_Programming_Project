import 'package:ecommerce_app/views/product/listProduct.dart';
import 'package:flutter/material.dart';

class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}

class _ProductManagementState extends State<ProductManagement> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 16,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color.fromARGB(185, 233, 30, 33),
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            actions: [
              PopupMenuButton(
                  icon: Icon(
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
                  GestureDetector(
                    onLongPress: () {
                      _showMenu(context);
                    },
                    child: Text("Hai"),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _showMenu(context);
                    },
                    child: Text("Ba"),
                  ),
                  GestureDetector(
                    onLongPress: () {
                      _showMenu(context);
                    },
                    child: Text("Bốn"),
                  )
                ]),
          ),
          body: const TabBarView(
            children: [
              // Nội dung tab mặc định
              ListProduct(),
              Center(
                child: Text('Laptop'),
              ),
              Center(
                child: Text('RAM'),
              ),
              Center(
                child: Text('Mainboard'),
              ),
              Center(
                child: Text('Cpu'),
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
