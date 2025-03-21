import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoritesViewHeader extends StatelessWidget {
  const FavoritesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.secondaryColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Favorites',
            style: AppTextStyles.semibold18.copyWith(
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
