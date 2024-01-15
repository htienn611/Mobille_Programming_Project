import 'package:ecommerce_app/models/order_detail.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/presenters/product_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class itemOrderDetail extends StatefulWidget {
   itemOrderDetail({super.key,required this.oderDetail});
   OrderDetail oderDetail;
   

  @override
  State<itemOrderDetail> createState() => _itemOrderDetailState();
}

class _itemOrderDetailState extends State<itemOrderDetail> {
  ProductPresenter proPre=ProductPresenter();
 late Product product;
  void loaddata()async{
     product= await proPre.getProductByID(widget.oderDetail.idProduct);
     setState(() {
       
     });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  @override
  Widget build(BuildContext context) {
  
    return product==null?CircularProgressIndicator(): Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
            border: Border.symmetric(
                vertical: BorderSide.none,
                horizontal:  BorderSide(color: Color.fromARGB(255, 243, 243, 243)))),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                'assets/img/laptop1.png',
                fit: BoxFit.cover,
                width: 20,
                height: 100,
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text('${product.name}'),
                     Padding(padding: EdgeInsets.all(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [Text('${product.price}'), Text('${widget.oderDetail.quantityProduct}')],
                    )
                  ],
                ))
          ],
        ));
  }
}
