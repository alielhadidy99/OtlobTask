class CategoryModel {
  int status;
  String subMessage;
  List<CategoryReturn> ret=[];
  String message;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    if (json['return'] != null) {
      ret = new List<CategoryReturn>();
      json['return'].forEach((v) {
        ret
        .add(new CategoryReturn.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class CategoryReturn {
  int id;
  String name;

  CategoryReturn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
