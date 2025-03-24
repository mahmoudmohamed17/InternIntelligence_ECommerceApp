import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/managers/home_cubit/home_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp.router(
          theme: ThemeData(fontFamily: 'Poppins'),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouting.router,
        ),
    );
  }
}
