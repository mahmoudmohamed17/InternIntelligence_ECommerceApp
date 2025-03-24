import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsViewFooter extends StatelessWidget {
  const ProductDetailsViewFooter({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 24,
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              context.read<ProductCubit>().changeCartStatus(product);
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor:
                  product.isAddedToCart
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.all(12),
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                product.isAddedToCart ? 'Added' : 'Add',
                style: AppTextStyles.semibold18.copyWith(
                  color:
                      product.isAddedToCart
                          ? Colors.white
                          : AppColors.primaryTextColor,
                ),
              ),
            ),
          ),
        ),
        Text(
          r'$'
          '${product.productPrice.toStringAsFixed(2)}',
          style: AppTextStyles.semibold18.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
