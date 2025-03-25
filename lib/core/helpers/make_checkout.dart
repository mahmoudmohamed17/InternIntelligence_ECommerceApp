import 'package:e_commerce_app/managers/product_cubit/product_cubit.dart';
import 'package:e_commerce_app/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/services/notifications_service.dart';
import 'package:e_commerce_app/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> makeCheckout(BuildContext context) async {
  var amount = context.read<ProductCubit>().totalPrice.toStringAsFixed(2);
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
}
