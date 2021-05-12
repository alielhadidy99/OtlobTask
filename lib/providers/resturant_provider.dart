import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otlob_task/constants.dart';
import 'package:otlob_task/model/resturants_model.dart';
import 'package:http/http.dart' as http;

class ResturantsProvider extends ChangeNotifier {


  Future<ResturantsModel> getResturants({dynamic langu,dynamic id}) async {
    final response = await http.get(Uri.parse('${RESTURANTSURL}?langu=$langu&catId=$id'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var resModel = ResturantsModel.fromJson(body);
      return resModel;
    }
    notifyListeners();
  }


}
