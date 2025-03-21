import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:e_commerce_app/widgets/cart_products_list_view.dart';
import 'package:flutter/material.dart';

class CartViewWidget extends StatelessWidget {
  const CartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            child: CustomHeader(title: 'Cart'),
          ),
          verticalSpace(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  'Total: 9',
                  style: AppTextStyles.semibold18.copyWith(
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(12),
          const Expanded(child: CartProductsListView()),
          verticalSpace(8),
        ],
      ),
    );
  }
}
