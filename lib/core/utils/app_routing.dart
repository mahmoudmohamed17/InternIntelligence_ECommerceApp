import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/views/main_view.dart';
import 'package:e_commerce_app/views/notifications_view.dart';
import 'package:e_commerce_app/views/product_details_view.dart';
import 'package:flutter/material.dart';

class AppRouting {
  static const mainView = '/mainView';
  static const productDetailsView = '/productDetailsView';
  static const notificationsView = '/notificationsView';

  Route<dynamic> onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouting.mainView:
        return MaterialPageRoute(builder: (context) => const MainView());
      case AppRouting.productDetailsView:
        final product = settings.arguments as ProductEntity;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsView(product: product),
        );
      case AppRouting.notificationsView:
        return MaterialPageRoute(
          builder: (context) => const NotificationsView(),
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
