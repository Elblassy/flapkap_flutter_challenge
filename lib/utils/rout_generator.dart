import 'package:flapkap_flutter_challenge/ui/navigation/navigation.dart';
import 'package:flapkap_flutter_challenge/viewmodels/orders_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => ChangeNotifierProvider(
            create: (BuildContext context) => OrderViewmodel(),
            builder: (context, child) => const AppNavigator(),
          ),
          settings: const RouteSettings(name: AppNavigator.routeName),
        );
    }
  }
}
