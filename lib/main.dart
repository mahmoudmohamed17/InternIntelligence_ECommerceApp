import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/utils/api_keys.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/core/utils/my_bloc_observer.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/managers/app_theme_cubit/app_theme_cubit.dart';
import 'package:e_commerce_app/managers/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/managers/favorites_cubit/favorites_cubit.dart';
import 'package:e_commerce_app/managers/home_cubit/home_cubit.dart';
import 'package:e_commerce_app/managers/notifications_cubit/notifications_cubit.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/services/notifications_service.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([
    SharedPrefs.init(),
    NotificationsService().initNotifications(),
  ]);
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
        BlocProvider(create: (context) => FavoritesCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AppThemeCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
      ],
      child: BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
              fontFamily: 'Poppins',
              brightness:
                  SharedPrefs.getBool(AppConstants.isDarkMode)
                      ? Brightness.dark
                      : Brightness.light,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRouting.mainView,
            onGenerateRoute: AppRouting().onGeneratedRoute,
          );
        },
      ),
    );
  }
}
