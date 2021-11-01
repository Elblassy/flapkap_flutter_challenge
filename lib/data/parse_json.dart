import 'dart:convert';
import 'package:flapkap_flutter_challenge/models/order_model.dart';
import 'package:flutter/services.dart';

class ParseJson {
  ParseJson._privateConstructor();

  static final ParseJson _singleton = ParseJson._privateConstructor();

  factory ParseJson() {
    return _singleton;
  }

  Future<List<OrderModel>> readOrders() async {
    final String response = await rootBundle.loadString('assets/orders.json');
    List data = await json.decode(response);
   return data.map((item) => OrderModel.fromJson(item)).toList();
  }
}
