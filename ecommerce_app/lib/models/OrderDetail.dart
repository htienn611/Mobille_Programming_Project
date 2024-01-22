class OrderDetail{
  int quantityProduct;
  int idOrder;
  int idProduct;

  OrderDetail(this.quantityProduct,this.idOrder,this.idProduct);

  OrderDetail.fromJson(Map<String, dynamic> json)
    :quantityProduct=json['quantityProduct']??0,
    idOrder=json['idOrder']??0,
    idProduct=json['idProduct']??0;
}