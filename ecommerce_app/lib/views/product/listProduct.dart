import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  List<Product> danhSachSanPham = [];
  String dropDownValue = "Laptop";
  void loadData() async {
    List<Product> sanPhamList = await Product.getProductLst();
    setState(() {
      danhSachSanPham = sanPhamList;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
  void _editProduct(BuildContext context) {
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
                      child: Image(
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
                        child: Icon(
                          Icons.camera_alt_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(50)),
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
              DropdownButton<String>(
                value: dropDownValue,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownValue = newValue!;
                    print(dropDownValue);
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                      value: 'Laptop', child: Text("Laptop")),
                  DropdownMenuItem<String>(value: 'Ram', child: Text("Ram")),
                  DropdownMenuItem<String>(value: 'Cpu', child: Text("Cpu")),
                  DropdownMenuItem<String>(
                      value: 'Screen', child: Text("Screen")),
                ],
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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(5),
        itemCount: danhSachSanPham.length,
        itemBuilder: (context, index) {
          Product sanPham = danhSachSanPham[index];
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
            Text(sanPham.name.toString(),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),softWrap: true,),
            Text("${sanPham.price} vnđ"),
            //Text("256GB"),
            Text("Số lượng: ${sanPham.quantity.toString()}")
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
  })
;
  }
}
