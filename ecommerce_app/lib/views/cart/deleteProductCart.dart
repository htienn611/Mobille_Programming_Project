// import 'package:ecommerce_app/models/cart_detail.dart';
// import 'package:ecommerce_app/presenters/cartdetail_presenter.dart';
// import 'package:flutter/material.dart';

// class DeleteProductCart extends StatefulWidget {
//   const DeleteProductCart({super.key, required this.cartDetail});
//   final CartDetail cartDetail;

//   @override
//   State<DeleteProductCart> createState() => _DeleteProductCartState();
// }

// class _DeleteProductCartState extends State<DeleteProductCart> {
//   CartDetailPresenter cartPre = CartDetailPresenter();
//   bool checkDelete = false;

//   void showMessSnackBar(String mes) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(mes),
//         duration:const Duration(seconds: 2),
//       ),
//     );
//   }

//   void _showDeleteConfirmation(BuildContext context, CartDetail cart) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title:const Text('Xóa'),
//           content:const Text('Bạn có chắc chắn muốn xóa không?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);

//               },
//               child:const Text('Hủy'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 checkDelete = await cartPre.deleteCartDetailPresenter(cart);
//                 if (checkDelete) {
//                   Navigator.pop(context);
//                   showMessSnackBar("Đã xóa");
//                   setState(() {
//                   });
//                 } else {
//                   Navigator.pop(context);
//                   showMessSnackBar("Không thể xóa sản phẩm");
//                 }
//               },
//               child:const Text('Xóa'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           _showDeleteConfirmation(context, widget.cartDetail);
//         },
//         icon:const Icon(Icons.delete_outline_rounded));
//   }
// }
