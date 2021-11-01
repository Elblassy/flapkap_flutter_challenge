import 'package:flapkap_flutter_challenge/data/parse_json.dart';
import 'package:flapkap_flutter_challenge/models/chart_model.dart';
import 'package:flapkap_flutter_challenge/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderViewmodel extends ChangeNotifier {
  List<OrderModel> orderList = [];
  final Map<String, int> _chart = {};
  List<ChartModel> chartList = [];

  Future<void> getOrders() async {
    orderList.clear();
    final orders = await ParseJson().readOrders();
    orderList.addAll(orders);
    notifyListeners();
  }

  void setChart() {
    for (var order in orderList) {
      final dateTime = DateTime.parse(order.registered ?? "");
      final format = DateFormat('yyyy-MM-dd');
      final dateFormatted = format.format(dateTime);

      if (dateFormatted != "") {
        if (_chart.containsKey(dateFormatted)) {
          _chart[dateFormatted] = _chart[dateFormatted]! + 1;
        } else {
          _chart.putIfAbsent(dateFormatted, () => 1);
        }
      }
    }

    chartList = _chart.entries
        .map((e) => ChartModel(date: e.key, numOfOrders: e.value))
        .toList();
  }
}
