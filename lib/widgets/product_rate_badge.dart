import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProductRateBadge extends StatelessWidget {
  const ProductRateBadge({super.key, required this.productRate});
  final num productRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryColor, AppColors.deepPrimaryColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xffA9A9A9),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(2, 2.5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Text(
        productRate.toStringAsFixed(1),
        style: AppTextStyles.bold12.copyWith(color: Colors.white),
      ),
    );
  }
}
