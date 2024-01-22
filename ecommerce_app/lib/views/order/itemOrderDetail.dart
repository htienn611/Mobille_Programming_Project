import 'package:ecommerce_app/models/order.dart';
import 'package:ecommerce_app/models/OrderDetail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/order_presenter.dart';
import 'package:ecommerce_app/presenters/orderdetail_presenters.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:ecommerce_app/views/order/orderDetail.dart';
import 'package:flutter/material.dart';

class ItemOrderDetail extends StatefulWidget {
  ItemOrderDetail({super.key, required this.idOrder});
  int idOrder;

  @override
  State<ItemOrderDetail> createState() => _ItemOrderDetailState();
}

class _ItemOrderDetailState extends State<ItemOrderDetail> {
  late double sumMoney;
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
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      for (var product in _product)
          Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start ,
            children: [
              Text(
                '${product.name}',
                style: TextStyle(color: Colors.brown,fontWeight: FontWeight.bold,),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${product.price}',style: TextStyle(color: Colors.red),),
                  Text('x${_orderDetail.quantityProduct}'),
                  
                ],
              )
            ],
          ),
        )
    ]);
  }
}
