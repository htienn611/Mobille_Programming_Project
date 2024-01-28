import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/views/product/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductLabel extends StatefulWidget {
  const ProductLabel({super.key, required this.product});
  final Product product;
  @override
  State<ProductLabel> createState() => _ProductLabelState();
}

class _ProductLabelState extends State<ProductLabel> {
  @override
  Widget build(BuildContext context) {
    var wS = MediaQuery.of(context).size.width;
    var wItem =  (wS * 0.4<160?175:wS*0.4>190?175:wS*0.4)*1.0;
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(product: widget.product),
              ));
        },
        child: Container(
          width: wItem,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/img/laptop1.png')),
              RichText(
                  softWrap: true,
                  text: TextSpan(
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      text: widget.product.name)),
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   widget.product.price.toString(),
              //   style: const TextStyle(decoration: TextDecoration.lineThrough),
              // ),
              const SizedBox(
                height: 5,
              ),
               Text(
                "${NumberFormat.currency(locale: 'vi_VN', symbol: '', decimalDigits: 0).format(widget.product.price)} vnđ",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize:15,
                    color: Colors.red),
              ),
              // wItem > 160
              //     ?
              //     Row(
                //      children: [
                      //  Text(widget.product.price.toString()),
                        // Container(
                        //   margin: const EdgeInsets.only(left: 10),
                        //   decoration: BoxDecoration(
                        //       border: Border.all(color: Colors.red)),
                        //   padding: const EdgeInsets.all(5),
                        //   child: const Text(
                        //     "-100%",
                        //     style: TextStyle(color: Colors.red),
                        //   ),
                        // )
                     // ],
                   // )
                  // : Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text("10.000.000 đ"),
                  //       Container(
                  //         margin: const EdgeInsets.only(bottom: 10),
                  //         decoration: BoxDecoration(
                  //             border: Border.all(color: Colors.red)),
                  //         padding: const EdgeInsets.all(5),
                  //         child: const Text(
                  //           "-100%",
                  //           style: TextStyle(color: Colors.red),
                  //         ),
                  //       )
                  //     ],
                  //   ),
              Row(
                children: [
                  Text(
                    '5.0',
                    style: TextStyle(color: Colors.yellow[600]),
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow[600],
                  ),
                  const Text("(400 đánh giá)")
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: wItem,
                padding: EdgeInsets.only(
                    left: (wItem - (wItem - 40)) / 2,
                    right: (wItem - (wItem - 40)) / 2),
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    width: wS * 0.4 - 40,
                    height: 25,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 99, 99),
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 26 * (wItem - 40) / 50,
                      height: 25,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 2, 2),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  const Text(
                    "Đã bán: 5",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
