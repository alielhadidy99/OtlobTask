class LoginModel {
  int status;
  String subMessage;
  UserData data;
  String message;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    subMessage = json['sub_message'];
    data = json['return'] != null ? UserData.fromJson(json['return']) : null;
    message = json['message'];
  }
}

class UserData {
  int id;
  int age;
  String gender;
  String mobile;
  String password;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    age = json['age'];
    gender = json['gender'];
    mobile = json['mobile'];
    password = json['password'];
  }
}
