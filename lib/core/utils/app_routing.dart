import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const Scaffold();
        },
      ),
    ],
  );
}
