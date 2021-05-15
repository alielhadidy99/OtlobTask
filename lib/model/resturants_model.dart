class ResturantsModel {
  int status;
  String subMessage;
  List<ResturantsReturn> ret = [];
  String message;

  ResturantsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    if (json['return'] != null) {
      ret = new List<ResturantsReturn>();
      json['return'].forEach((v) {
        ret.add(new ResturantsReturn.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class ResturantsReturn {
  String restId;
  String restName;
  String restImg;
  String restLocation;
  String restType;
  dynamic catId;
  double rate;
  dynamic delivery;
  String open;
  String close;
  List<Products> ret = [];

  ResturantsReturn.fromJson(Map<String, dynamic> json) {
    restId = json['rest_id'];
    restName = json['rest_name'];
    restImg = json['rest_img'];
    restLocation = json['rest_location'];
    restType = json['rest_type'];
    catId = json['cat_id'];
    rate = json['rate'].toDouble();
    delivery = json['delivery'];
    open = json['open'];
    close = json['close'];
    if (json['return'] != null) {
      ret = new List<Products>();
      json['return'].forEach((v) {
        ret.add(new Products.fromJson(v));
      });
    }
  }
}

class Products {
  String prodName;
  dynamic prodId;
  String prodPrice;
  String prodImage;

  Products.fromJson(Map<String, dynamic> json) {
    prodName = json['prod_name'];
    prodId = json['prod_id'];
    prodPrice = json['prod_price'];
    prodImage = json['prod_image'];
  }
}
