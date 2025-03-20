import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 24,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.primaryColor,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.all(24),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Added',
                style: AppTextStyles.semibold18.copyWith(
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ),
        ),
        Text(
          r'$30.39',
          style: AppTextStyles.semibold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
