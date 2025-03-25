import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/managers/app_theme_cubit/app_theme_cubit.dart';
import 'package:e_commerce_app/models/drawer_item_model.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:e_commerce_app/widgets/drawer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
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
                  title: 'Notifications',
                  icon: FontAwesomeIcons.solidBell,
                  onTap: () {},
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
                  title: 'Support',
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
              const Divider(),
              ListTile(
                leading:
                    SharedPrefs.getBool(AppConstants.appTheme)
                        ? const Icon(
                          Icons.light_mode,
                          color: AppColors.primaryColor,
                        )
                        : const Icon(
                          Icons.dark_mode,
                          color: AppColors.primaryColor,
                        ),
                title: Text(
                  SharedPrefs.getBool(AppConstants.appTheme)
                      ? 'Light Mode'
                      : 'Dark Mode',
                  style: AppTextStyles.regular14,
                ),
                trailing: Switch(
                  value: SharedPrefs.getBool(AppConstants.appTheme),
                  onChanged: (value) {
                    context.read<AppThemeCubit>().changeTheme(value);
                  },
                ),
              ),
              const Spacer(),
              ListTile(
                leading: const Icon(
                  FontAwesomeIcons.rightFromBracket,
                  color: AppColors.primaryColor,
                ),
                title: const Text("Logout", style: AppTextStyles.regular14),
                onTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
