import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProductSalaryAndBuyButton extends StatelessWidget {
  const ProductSalaryAndBuyButton({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            r'$'
            '${product.productPrice.toStringAsFixed(2)}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.semibold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        const CustomButton(),
      ],
    );
  }
}
