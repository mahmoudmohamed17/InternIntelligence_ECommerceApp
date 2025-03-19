import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    Center(child: Text('Home')),
    Center(child: Text('Favorites')),
    Center(child: Text('Cart')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[800]!, // tab button ripple color when pressed
        hoverColor: Colors.grey[700]!, // tab button hover color
        haptic: true, // haptic feedback
        tabBorderRadius: 15,
        tabActiveBorder: Border.all(
          color: Colors.black,
          width: 1,
        ), // tab button border
        tabBorder: Border.all(
          color: Colors.grey,
          width: 1,
        ), // tab button border
        tabShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8),
        ], // tab button shadow
        curve: Curves.easeOutExpo, // tab animation curves
        duration: Duration(milliseconds: 900), // tab animation duration
        gap: 8, // the tab button gap between icon and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.purple, // selected icon and text color
        iconSize: 24, // tab button icon size
        tabBackgroundColor: Colors.purple.withOpacity(
          0.1,
        ), // selected tab background color
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ), // navigation bar padding
        tabs: const [
          GButton(icon: FontAwesomeIcons.house, text: 'Home'),
          GButton(icon: FontAwesomeIcons.solidHeart, text: 'Likes'),
          GButton(icon: FontAwesomeIcons.cartShopping, text: 'Search'),
          GButton(icon: FontAwesomeIcons.user, text: 'Profile'),
        ],
      ),
    );
  }
}
