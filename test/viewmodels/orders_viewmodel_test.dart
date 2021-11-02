import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Testing Orders Viewmodel:", () {
    var orderViewModel = OrderViewmodel();

    test("Orders should be get", () async {
      await orderViewModel.getOrders();
      expect(orderViewModel.averagePrice > 0.0, true);
      expect(orderViewModel.orderList.isNotEmpty, true);
    });

    test("Check set chart", () {
      orderViewModel.setChart();
      expect(orderViewModel.chartList.isNotEmpty, true);
    });

  });
}
