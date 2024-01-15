class OrderDetail{
  int quantityProduct;
  int idOrder;
  int idProduct;

  OrderDetail(this.quantityProduct,this.idOrder,this.idProduct);

  OrderDetail.fromJson(Map<String, dynamic> json)
    :quantityProduct=json['quantityProduct'],
    idOrder=json['idOrder'],
    idProduct=json['idProduct'];
}