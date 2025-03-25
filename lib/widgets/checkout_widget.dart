import 'package:e_commerce_app/core/helpers/app_colors.dart';
import 'package:e_commerce_app/core/helpers/app_text_styles.dart';
import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/services/notifications_service.dart';
import 'package:e_commerce_app/services/stripe_service.dart';
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
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    var amount = context
                        .read<ProductCubit>()
                        .totalPrice
                        .toStringAsFixed(2);
                    var model = PaymentIntentInputModel(
                      amount: amount,
                      currency: 'USD',
                      customerId: 'cus_S0azXeScs3nOZI',
                    );
                    await StripeService().makePayment(model: model);
                    var notificationMessage =
                        'Dear Customer, you have successfully completed your purchase totaling \$$amount';
                    NotificationsService().sendLocalNotification(
                      title: 'New Purchase!',
                      body: notificationMessage,
                    );
                  },
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
              ),
            ],
          ),
        );
      },
    );
  }
}
