import 'package:dio/dio.dart';
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
        token: ApiKeys.secretKey,
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
      customerId: 'cus_RpJkhDSurfQKCd', // don't forget
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
        clientSecret: paymentIntentModel.clientSecret,
        customerId: model.customerId,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(model: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<CustomerModel> createCusomer(CustomerInputModel model) async {
    var response = await _apiService.post(
        url: customerCreationUrl,
        body: model.toJson(),
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType);
    var customerModel =
        CustomerModel.fromJson(response.data); // parsing the data from response
    return customerModel;
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
          'Authorization': 'Bearer ${ApiKeys.secretKey}',
          'Stripe-Version': '2025-01-27.acacia',
        },
        token: ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType);
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(
        response.data); // parsing the data from response
    return ephemeralKeyModel;
  }
}