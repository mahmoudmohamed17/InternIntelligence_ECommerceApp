import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewContent extends StatelessWidget {
  const ProductDetailsViewContent({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          product.productName,
          style: AppTextStyles.bold24.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
        Text(
          product.productDescription,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.secondaryTextColor,
          ),
        ),
      ],
    );
  }
}
