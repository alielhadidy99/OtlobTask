import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:otlob_task/constants.dart';
import 'package:otlob_task/model/item_model.dart';

class ItemProvider extends ChangeNotifier {

  Future<ItemModel> getItems({dynamic langu,dynamic id}) async {
    final response = await http.get(Uri.parse('${ITEMURL}?restId=$id&langu=$langu'));
    if(response.statusCode == 200){
      var body = jsonDecode(response.body);
      var itemModel = ItemModel.fromJson(body);
      return itemModel;
    }
    notifyListeners();
  }
}
