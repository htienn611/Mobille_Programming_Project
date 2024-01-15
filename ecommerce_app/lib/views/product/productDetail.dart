import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(185, 233, 30, 33),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
                      Image.asset(
              'assets/img/laptop/laptop.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width-100,
            ),
          Text(
              "Laptop Acer Aspire 5 Gaming A515 58GM 51LB i5 13420H/16GB/512GB/4GB RTX2050/Win11",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
          Text(
            "32.000.000 vnđ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.red ),
          ),
            Text("Số lượng: 20"),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Những mẫu laptop Aspire Gaming chắc chắn đã quá quen thuộc với anh em nhờ hiệu năng mạnh mẽ nhưng lại được gắn với mác giá vô cùng hợp lý. Với mẫu Acer Aspire 5 Gaming vào năm 2023 này chắc chắn sẽ không làm mọi người thất vọng với cũng giá đó nhưng hiệu năng có phần được nâng lên nữa.Laptop được trang bị bộ vi xử lý Intel Core i5 Raptor Lake - 13420H cùng card rời NVIDIA GeForce RTX 2050 4 GB đa nhiệm hiệu quả cho mình mọi công việc trên cơ quan, học tập hay giải trí thường ngày đến việc thực hiện các bản thiết kế trên nền tảng Premiere, Photoshop,... tuy nhiên với các ấn phẩm nghệ thuật, đồ hoạ động quá nhiều layer hay effect thì mình đánh giá máy chưa đáp ứng được nhanh chóng, nếu chỉ sử dụng cho công việc thông thường thôi thì vẫn rất ok nha.",
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    "Trúc Trần",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Rất tuyệt")
                ],
              ),
              SizedBox(
                width: 200,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.send))
            ]),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.greenAccent,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
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
            padding: EdgeInsets.all(8),
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              label: "Thêm"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.flash_on,
                color: Colors.white,
              ),
              label: "Mua ngay")
        ],
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        backgroundColor: Color.fromARGB(147, 233, 30, 33),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
