import 'package:e_commerce_app/core/helpers/product_entity.dart';
import 'package:e_commerce_app/managers/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/managers/notifications_cubit/notifications_cubit.dart';
import 'package:e_commerce_app/models/notification_item_model.dart';
import 'package:e_commerce_app/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/services/notifications_service.dart';
import 'package:e_commerce_app/services/stripe_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

Future<void> makeCheckout(
  BuildContext context,
  List<ProductEntity> products,
) async {
  var amount = context.read<CartCubit>().totalPrice.round().toString();
  var model = PaymentIntentInputModel(
    amount: '${amount}00',
    currency: 'USD',
    customerId: 'cus_S1BglaXJEYrkU3',
  );
  await StripeService().makePayment(model: model);
  var notificationMessage =
      'Dear Customer, you have successfully completed your purchase totaling \$$amount';
  NotificationsService().sendLocalNotification(
    title: 'New Purchase!',
    body: notificationMessage,
  );
  var currentTime = DateTime.now();
  var date = DateFormat('yMMMMd').format(currentTime);
  var notification = NotificationItemModel(
    content: notificationMessage,
    date: date,
  );
  // ignore: use_build_context_synchronously
  context.read<NotificationsCubit>().addNotfication(notification);
  // ignore: use_build_context_synchronously
  context.read<CartCubit>().emptyCart();
  // ignore: use_build_context_synchronously
  context.read<CartCubit>().updateCartEmptyBackend();
}
