import 'package:e_commerce_app/views/main_view.dart';
import 'package:e_commerce_app/views/notifications_view.dart';
import 'package:e_commerce_app/views/product_details_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static const productDetailsView = '/productDetailsView';
  static const notificationsView = '/notificationsView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MainView();
        },
      ),
      GoRoute(
        path: productDetailsView,
        builder: (context, state) {
          return const ProductDetailsView();
        },
      ),
      GoRoute(
        path: notificationsView,
        builder: (context, state) {
          return const NotificationsView();
        },
      ),
    ],
  );
}
