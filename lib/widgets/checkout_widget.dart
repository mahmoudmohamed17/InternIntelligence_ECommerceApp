import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/core/helpers/make_checkout.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: AppTextStyles.semibold18.copyWith(
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    r'$'
                    '${context.read<ProductCubit>().totalPrice.toStringAsFixed(2)}',
                    style: AppTextStyles.semibold18.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              EasyButton(
                idleStateWidget: Text(
                  'Checkout',
                  style: AppTextStyles.semibold18.copyWith(color: Colors.white),
                ),
                loadingStateWidget: const CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                useWidthAnimation: false,
                borderRadius: 100.0,
                contentGap: 6.0,
                buttonColor: AppColors.primaryColor,
                onPressed: () {
                  makeCheckout(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
