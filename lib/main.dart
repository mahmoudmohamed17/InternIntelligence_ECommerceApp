import 'package:device_preview/device_preview.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:flutter/material.dart';

void main()  {
  runApp(
    DevicePreview(
      builder: (context) {
        return const MyApp();
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouting.router,
    );
  }
}
