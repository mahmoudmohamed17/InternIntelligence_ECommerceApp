import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/managers/app_theme_cubit/app_theme_cubit.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeSwitchButton extends StatelessWidget {
  const AppThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, state) {
        return ListTile(
          leading: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: Icon(
              SharedPrefs.getBool(AppConstants.isDarkMode)
                  ? Icons.dark_mode
                  : Icons.light_mode,
              key: ValueKey<bool>(SharedPrefs.getBool(AppConstants.isDarkMode)),
              color: AppColors.primaryColor,
            ),
          ),
          title: Text(
            SharedPrefs.getBool(AppConstants.isDarkMode)
                ? 'Dark Mode'
                : 'Light Mode',
            style: AppTextStyles.regular14,
          ),
          trailing: Switch(
            value: SharedPrefs.getBool(AppConstants.isDarkMode),
            onChanged: (value) {
              context.read<AppThemeCubit>().changeTheme(value);
            },
          ),
        );
      },
    );
  }
}
