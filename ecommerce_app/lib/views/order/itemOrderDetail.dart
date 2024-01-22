// ignore_for_file: file_names
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemOrderDetail extends StatefulWidget {
  ItemOrderDetail({super.key, required this.idOrder,required this.sum});
  int idOrder;
  Function (double ) sum; 

  @override
  State<ItemOrderDetail> createState() => _ItemOrderDetailState();
}

class _ItemOrderDetailState extends State<ItemOrderDetail> {
  List<Widget> lst =[];
  double rs=0.0;
  ProductPresenter proPre = ProductPresenter();
  OrderDetailPresenter orderDetailPre = OrderDetailPresenter();
  late OrderDetail _orderDetail;
  List<Product> _product = List.filled(
      0,
      Product(
          id: 0,
          image: "",
          name: "",
          quantity: 0,
          price: 0,
          des: "",
          idDiscount: 0,
          status: 0,
          idCate: 0,
          idBrand: 0));

  void loadData() async {
    _product = await proPre.getInfoProductByIdOrderDetail(widget.idOrder);
    _orderDetail = await orderDetailPre.getOrderDetailByID(widget.idOrder);
   for (var product in _product)
         lst.add( sum(product));
    widget.sum(rs);
    //setState(() {});
  }



  @override
  void initState() {
    super.initState();
    loadData();
  }


  Widget sum(Product product){
    rs+= product.price*_orderDetail.quantityProduct;
    print(rs);
    return Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Text(
                // ignore: unnecessary_string_interpolations
                '${product.name}',
                style: const TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${product.price}',style: const TextStyle(color: Colors.red),),
                  Text('x${_orderDetail.quantityProduct}'),
                  
                ],
              )
            ],
          ),
        );
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: lst);
  }
}
