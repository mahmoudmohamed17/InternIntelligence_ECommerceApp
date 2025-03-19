import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:flutter/material.dart';

class ProductSalaryAndBuyButton extends StatefulWidget {
  const ProductSalaryAndBuyButton({super.key});

  @override
  State<ProductSalaryAndBuyButton> createState() =>
      _ProductSalaryAndBuyButtonState();
}

class _ProductSalaryAndBuyButtonState extends State<ProductSalaryAndBuyButton> {
  bool _isAddedToCart = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: context.width * 0.25,
          child: Text(
            r'$30.96',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.semibold16.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _isAddedToCart = !_isAddedToCart;
            });
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:
                _isAddedToCart
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
            shadowColor: Colors.transparent,
          ),
          child: Text(
            _isAddedToCart ? 'Added' : 'Add',
            style: AppTextStyles.bold12.copyWith(
              color: _isAddedToCart ? Colors.white : AppColors.primaryTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
