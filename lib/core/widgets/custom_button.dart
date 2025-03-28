import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        context.read<ProductCubit>().changeCartStatus(context, product);
        await context.read<ProductCubit>().updateProduct(product);
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor:
            product.isAddedToCart
                ? AppColors.primaryColor
                : AppColors.secondaryColor,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          product.isAddedToCart ? 'Added' : 'Add',
          style: AppTextStyles.bold12.copyWith(
            color:
                product.isAddedToCart
                    ? Colors.white
                    : AppColors.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
