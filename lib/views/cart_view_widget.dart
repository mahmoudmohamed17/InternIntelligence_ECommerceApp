import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/context_extension.dart';
import 'package:e_commerce_app/core/utils/spaces.dart';
import 'package:e_commerce_app/core/widgets/custom_header.dart';
import 'package:e_commerce_app/managers/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/widgets/cart_products_list_view.dart';
import 'package:e_commerce_app/widgets/checkout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      'Total: ${context.read<CartCubit>().cartProducts.length}',
                      style: AppTextStyles.semibold18.copyWith(),
                    );
                  },
                ),
              ],
            ),
          ),
          verticalSpace(12),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartFilled) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CartProductsListView(products: state.products),
                  ),
                );
              } else {
                return Column(
                  children: [
                    verticalSpace(context.height * 0.33),
                    Text(
                      'You haven\'t add any products yet!',
                      style: AppTextStyles.semibold18.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    verticalSpace(context.height * 0.33),
                  ],
                );
              }
            },
          ),
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartFilled) {
                return  CheckoutWidget(products: state.products,);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
