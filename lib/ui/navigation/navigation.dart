import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flapkap_flutter_challenge/ui/graph/graph.dart';
import 'package:flapkap_flutter_challenge/ui/orders/orders.dart';
import 'package:flapkap_flutter_challenge/utils/tools.dart';
import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppNavigator extends StatefulWidget {
  static const routeName = '/';

  const AppNavigator({Key? key}) : super(key: key);

  @override
  _AppNavigatorState createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator>
    with WidgetsBindingObserver {
  int? _selectedIndex = 0;

  final List<Widget>? _widgetOptions = [
    const OrdersScreen(),
    const GraphScreen()
  ];
  CurvedNavigationBar? _curvedNavigationBar;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isMobile()
        ? Scaffold(
            body: Center(
              child: _widgetOptions!.elementAt(_selectedIndex!),
            ),
            bottomNavigationBar: _curvedNavigationBar,
          )
        : Scaffold(
            body: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _widgetOptions!),
            ),
          );
  }

  @override
  void initState() {
    super.initState();
    _curvedNavigationBar = _buildBottomNav();

    Provider.of<OrderViewmodel>(context, listen: false).getOrders().then(
        (value) =>
            Provider.of<OrderViewmodel>(context, listen: false).setChart());
  }

  CurvedNavigationBar _buildBottomNav() {
    return CurvedNavigationBar(
      backgroundColor: bgColor,
      color: primaryColor,
      items: const <Widget>[
        Icon(
          Icons.shopping_cart_outlined,
          size: 30,
          color: Colors.white,
        ),
        Icon(
          Icons.stacked_line_chart,
          size: 30,
          color: Colors.white,
        ),
      ],
      onTap: (index) {
        _onItemTapped(index);
      },
    );
  }
}
