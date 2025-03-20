import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_constants.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewContent extends StatelessWidget {
  const ProductDetailsViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'This Is The Product Name',
          style: AppTextStyles.bold24.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          AppConstants.loremIpsum,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}

//
