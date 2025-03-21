import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          'Added',
          style: AppTextStyles.bold12.copyWith(
            color: AppColors.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
