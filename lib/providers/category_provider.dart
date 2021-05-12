import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:otlob_task/constants.dart';
import 'package:otlob_task/model/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {

  Future<CategoryModel> getCategory() async {
    final response = await http.get(Uri.parse(CATEGORYURL));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var catModel = CategoryModel.fromJson(body);
      return catModel;
    }
   notifyListeners();
  }




}
