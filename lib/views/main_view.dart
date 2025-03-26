import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_routing.dart';
import 'package:e_commerce_app/views/cart_view_widget.dart';
import 'package:e_commerce_app/views/favorites_view_widget.dart';
import 'package:e_commerce_app/views/home_view_widget.dart';
import 'package:e_commerce_app/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = AppRouting.mainView;

  @override
  State<MainView> createState() => _MainViewState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeViewWidget(),
    FavoritesViewWidget(),
    CartViewWidget(),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: IndexedStack(index: _currentIndex, children: _screens),
      drawer: const CustomDrawer(),
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 5,
        shape: const RoundedRectangleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: GNav(
            selectedIndex: _currentIndex,
            onTabChange: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            tabBorderRadius: 16,
            curve: Curves.easeIn, // tab animation curves
            gap: 8, // the tab button gap between icon and text
            color: AppColors.secondaryColor, // unselected icon color
            activeColor: Colors.white, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ), // navigation bar padding
            tabs: const [
              GButton(icon: FontAwesomeIcons.house),
              GButton(icon: FontAwesomeIcons.solidHeart),
              GButton(icon: FontAwesomeIcons.cartShopping),
              GButton(icon: FontAwesomeIcons.solidUser),
            ],
          ),
        ),
      ),
    );
  }
}
