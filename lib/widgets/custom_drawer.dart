import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/models/drawer_item_model.dart';
import 'package:e_commerce_app/widgets/app_theme_switch_button.dart';
import 'package:e_commerce_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Mahmoud Mohamed",
              style: AppTextStyles.semibold18.copyWith(color: Colors.white),
            ),
            accountEmail: Text(
              "mahmoud@example.com",
              style: AppTextStyles.regular14.copyWith(color: Colors.white),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesAccount),
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          DrawerItem(
            model: DrawerItemModel(
              title: 'Payments',
              icon: FontAwesomeIcons.creditCard,
              onTap: () {},
            ),
          ),
          DrawerItem(
            model: DrawerItemModel(
              title: 'Help Center',
              icon: FontAwesomeIcons.headset,
              onTap: () {},
            ),
          ),
          DrawerItem(
            model: DrawerItemModel(
              title: 'About Us',
              icon: FontAwesomeIcons.circleInfo,
              onTap: () {},
            ),
          ),
          DrawerItem(
            model: DrawerItemModel(
              title: 'Invite Friends',
              icon: FontAwesomeIcons.gift,
              onTap: () {},
            ),
          ),
          const Divider(),
          const AppThemeSwitchButton(),
          const Spacer(),
          DrawerItem(
            model: DrawerItemModel(
              title: 'Logout',
              icon: FontAwesomeIcons.rightFromBracket,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
