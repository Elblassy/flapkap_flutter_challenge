import 'package:flapkap_flutter_challenge/models/chart_model.dart';
import 'package:flapkap_flutter_challenge/models/order_model.dart';
import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<OrderViewmodel>(
          builder: (context, value, child) => SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            tooltipBehavior: TooltipBehavior(enable: true),
            zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
            series: <LineSeries<ChartModel, String>>[
              LineSeries<ChartModel, String>(
                  dataSource: value.chartList,
                  xValueMapper: (ChartModel order, _) => order.date,
                  yValueMapper: (ChartModel order, _) => order.numOfOrders)
            ],
            enableAxisAnimation: true,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Provider.of<OrderViewmodel>(context, listen: false).getOrders().then(
        (value) =>
            Provider.of<OrderViewmodel>(context, listen: false).setChart());
  }
}
