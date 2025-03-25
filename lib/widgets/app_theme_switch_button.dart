import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/managers/app_theme_cubit/app_theme_cubit.dart';
import 'package:e_commerce_app/services/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppThemeSwitchButton extends StatelessWidget {
  const AppThemeSwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
