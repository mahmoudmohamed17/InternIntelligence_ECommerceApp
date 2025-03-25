import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/managers/app_theme_cubit/app_theme_cubit.dart';
import 'package:e_commerce_app/managers/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ProductCubit()),
        BlocProvider(create: (context) => AppThemeCubit()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'Poppins',
              brightness:
                  SharedPrefs.getBool(AppConstants.isDarkMode)
                      ? Brightness.dark
                      : Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouting.router,
          );
        },
      ),
    );
  }
}
