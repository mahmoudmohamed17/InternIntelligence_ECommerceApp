import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({super.key, required this.currentPage, required this.productImagesCount});
  final int currentPage;
  final int productImagesCount;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: productImagesCount,
      position: currentPage + 0.0,
      animate: true,
      decorator: DotsDecorator(
        color: Colors.grey[300]!,
        activeColor: AppColors.primaryTextColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        size: const Size(8, 8),
        activeSize: const Size(12, 12),
      ),
    );
  }
}
