import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/utils/api_keys.dart';
import 'package:e_commerce_app/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:e_commerce_app/models/init_payment_sheet_input_model.dart';
import 'package:e_commerce_app/models/payment_intent_input_model.dart';
import 'package:e_commerce_app/models/payment_intent_model/payment_intent_model.dart';
import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final _apiService = ApiService();
  final paymentIntentUrl = 'https://api.stripe.com/v1/payment_intents';
  final customerCreationUrl = 'https://api.stripe.com/v1/customers';
  final ephemeralKeyCreationUrl = 'https://api.stripe.com/v1/ephemeral_keys';

  // step 1
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await _apiService.post(
        url: paymentIntentUrl,
        body: model.toJson(),
        token: ApiKeys.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType);
    var paymentIntentModel = PaymentIntentModel.fromJson(
        response.data); // parsing the data from response
    return paymentIntentModel;
  }

  // step 2
  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel model}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: model.clientSecret,
      customerEphemeralKeySecret: model.ephemeralKey,
      customerId: 'cus_S1BglaXJEYrkU3',
      // As we still in the test mode, we make a request outside editor in Postman to get
      // a customerId, utill we go live everything would change.
      merchantDisplayName: 'Mahmoud Mohamed', // The organization name
    ));
  }

  // step 3
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  // trigger this to excute the three main steps
  Future<void> makePayment({required PaymentIntentInputModel model}) async {
    var paymentIntentModel = await createPaymentIntent(model);
    var ephemeralKeyModel =
        await createEphemeralKey(customerId: model.customerId);
    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerId: model.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(model: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  // called each time a user want to make a payment process
  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await _apiService.post(
        url: ephemeralKeyCreationUrl,
        body: {
          'customer': customerId,
        },
        headers: {
          'Authorization': 'Bearer ${ApiKeys.stripeSecretKey}',
          'Stripe-Version': '2025-01-27.acacia',
        },
        token: ApiKeys.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType);
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(
        response.data); // parsing the data from response
    return ephemeralKeyModel;
  }
}