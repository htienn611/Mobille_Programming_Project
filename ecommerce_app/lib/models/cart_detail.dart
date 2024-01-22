class CartDetail{
  int idCart;
  int idProduct;
  int quantity;

  var product;

  CartDetail(this.idCart, this.idProduct, this.quantity);

  CartDetail.fromJson(Map<String, dynamic> json)
      : idCart = json['idCart'],
      idProduct = json['idProduct'],
      quantity = json['quantity'];
}