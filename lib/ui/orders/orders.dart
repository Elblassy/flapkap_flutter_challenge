import 'package:flapkap_flutter_challenge/ui/orders/widgets/home_card_info.dart';
import 'package:flapkap_flutter_challenge/utils/tools.dart';
import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<OrderViewmodel>(
      builder: (context, value, _) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: isMobile()
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeCardInfo(
                    image: "assets/images/orders.png",
                    opacityImage: "assets/images/orders_opacity.png",
                    title: "Orders",
                    number: value.orderList.length.toString(),
                    onPressed: () {},
                  ),
                  HomeCardInfo(
                    image: "assets/images/sales.png",
                    opacityImage: "assets/images/sales_opacity.png",
                    title: "Average Price",
                    number: "\$${value.averagePrice.toStringAsFixed(2)}",
                    onPressed: () {},
                  ),
                  HomeCardInfo(
                    image: "assets/images/return.png",
                    opacityImage: "assets/images/return_opacity.png",
                    title: "Number Of Returns",
                    number: value.numberOfReturned.toString(),
                    onPressed: () {},
                  )
                ],
              )
            : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeCardInfo(
                    image: "assets/images/orders.png",
                    opacityImage: "assets/images/orders_opacity.png",
                    title: "Orders",
                    number: value.orderList.length.toString(),
                    onPressed: () {},
                  ),
                  HomeCardInfo(
                    image: "assets/images/sales.png",
                    opacityImage: "assets/images/sales_opacity.png",
                    title: "Average Price",
                    number: "\$${value.averagePrice.toStringAsFixed(2)}",
                    onPressed: () {},
                  ),
                  HomeCardInfo(
                    image: "assets/images/return.png",
                    opacityImage: "assets/images/return_opacity.png",
                    title: "Number Of Returns",
                    number: value.numberOfReturned.toString(),
                    onPressed: () {},
                  )
                ],
              ),
            ),
      ),
    ));
  }

  @override
  void initState() {
    super.initState();
  }
}
