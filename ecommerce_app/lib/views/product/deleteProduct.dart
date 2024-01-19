import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';

class DeleteProduct extends StatefulWidget {
  final Product sanpham;
  const DeleteProduct({super.key, required this.sanpham});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  ProductPresenter proPre = ProductPresenter();
  bool checkDeleteProduct = false;

  void showMessSnackBar(String mess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mess),
        duration:const Duration(seconds: 2), // Đặt thời gian hiển thị
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, Product pro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:const Text('Xác nhận Xóa'),
          content:const Text('Bạn có chắc chắn muốn xóa không?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Đóng thông báo
              },
              child:const Text('Hủy'),
            ),
            TextButton(
              onPressed: () async {
                // Thực hiện xóa dữ liệu
                checkDeleteProduct = await proPre.deleteProductPresenter(pro);
                if (checkDeleteProduct) {
                  Navigator.pop(context);
                  showMessSnackBar("Xóa sản phẩm thành công");
                  setState(() {
                  });
                } else {
                  Navigator.pop(context);
                  showMessSnackBar("Xóa sản phẩm thất bại");
                }
              },
              child:const Text('Xóa'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _showDeleteConfirmation(context, widget.sanpham);
        },
        icon:const Icon(Icons.delete));
  }
}
