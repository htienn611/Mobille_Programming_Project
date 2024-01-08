import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OneProduct extends StatefulWidget {
  OneProduct({super.key});
  //late Product product;
  @override
  State<OneProduct> createState() => _OneProductState();
}

class _OneProductState extends State<OneProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 243, 247),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(227, 252, 228, 236),
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 1),
            )
          ]),
      width: MediaQuery.of(context).size.width,
      height: 150,
      padding: EdgeInsets.all(10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(width: 140, height: 150, color: Colors.grey),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Laptop 16inches del",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("26.000.000 vnđ"),
            Text("256GB")
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
                onPressed: () {
                  _editProduct(context);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  _showDeleteConfirmation(context);
                },
                icon: Icon(Icons.delete))
          ],
        )
      ]),
    );
  }
}

void _editProduct(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height - 200,
          child: Column(children: [
            Container(
                alignment: Alignment.center,
                width: 140,
                height: 150,
                color: Colors.grey),
            TextField(
              decoration: InputDecoration(hintText: "Tên sản phẩm"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Giá"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Mô tả"),
            ),
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
