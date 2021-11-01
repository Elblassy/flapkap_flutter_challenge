import 'package:flapkap_flutter_challenge/models/chart_model.dart';
import 'package:flapkap_flutter_challenge/ui/components/text_style.dart';
import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphScreen extends StatefulWidget {
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<OrderViewmodel>(
        builder: (context, value, child) =>
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: titleText("Orders Graph"),
                ),
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
                  series: <LineSeries<ChartModel, String>>[
                    LineSeries<ChartModel, String>(
                        dataSource: value.chartList,
                        xValueMapper: (ChartModel order, _) => order.date,
                        yValueMapper: (ChartModel order, _) =>
                        order.numOfOrders)
                  ],
                  enableAxisAnimation: true,
                ),
              ],
            ),
      ),
    );
  }

}
