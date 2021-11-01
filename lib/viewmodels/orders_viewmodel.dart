import 'package:flapkap_flutter_challenge/data/parse_json.dart';
import 'package:flapkap_flutter_challenge/models/chart_model.dart';
import 'package:flapkap_flutter_challenge/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderViewmodel extends ChangeNotifier {
  List<OrderModel> orderList = [];
  final Map<String, int> _chart = {};
  List<ChartModel> chartList = [];
  var averagePrice = 0.0;
  var numberOfReturned = 0;

  Future<void> getOrders() async {
    orderList.clear();
    final orders = await ParseJson().readOrders();
    orderList.addAll(orders);

    _setAverage();
    _setNumberOfReturned();

    notifyListeners();
  }

  void _setAverage() {
    var totalPrice = 0.0;
    NumberFormat numberFormat = NumberFormat("#,##0.00", "en_US");

    for (var e in orderList) {
      totalPrice += double.parse(numberFormat
          .parse(e.price?.substring(1, e.price?.length ?? 0 - 1) ?? "0.0")
          .toString());
    }

    averagePrice = totalPrice / orderList.length;
  }

  void _setNumberOfReturned() {
    for (var order in orderList) {
      if (order.status == "RETURNED") {
        numberOfReturned++;
      }
    }
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

    chartList.sort((a, b) => a.date.compareTo(b.date));
  }
}
