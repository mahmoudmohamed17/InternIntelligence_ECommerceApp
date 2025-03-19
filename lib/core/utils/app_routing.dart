import 'package:e_commerce_app/views/main_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const MainView();
        },
      ),
    ],
  );
}
