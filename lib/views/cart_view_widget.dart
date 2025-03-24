import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/widgets/cart_products_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewWidget extends StatelessWidget {
  const CartViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
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
                      'Total: ${context.read<ProductCubit>().cartProducts.length}',
                      style: AppTextStyles.semibold18.copyWith(
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(12),
              (state is ProductCartSuccess)
                  ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: CartProductsListView(products: state.products),
                    ),
                  )
                  : Center(
                    child: Text(
                      'You haven\'t add any products yet!',
                      style: AppTextStyles.semibold18.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
              (state is ProductCartSuccess)
                  ? Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 24,
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor: AppColors.primaryColor,
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Checkout',
                        style: AppTextStyles.semibold18.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
