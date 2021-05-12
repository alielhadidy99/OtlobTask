class ItemModel {
  int status;
  String subMessage;
  List<ItemReturn> ret=[];
  String message;

  ItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    if (json['return'] != null) {
      ret = new List<ItemReturn>();
      json['return'].forEach((v) {
        ret
            .add(ItemReturn.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class ItemReturn {
  String productName;
  int productQuantity;
  String productPrice;
  String productImage;


  ItemReturn.fromJson(Map<String, dynamic> json) {
    productName=json['prod_name'];
    productQuantity=json['prod_quantity'];
    productPrice=json['prod_price'];
    productImage=json['prod_image'];
  }
}
