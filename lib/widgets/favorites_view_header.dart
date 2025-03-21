import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class FavoritesViewHeader extends StatelessWidget {
  const FavoritesViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.secondaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Favorites',
            style: AppTextStyles.bold24.copyWith(
              color: AppColors.primaryTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
