import 'package:meta/meta.dart';

class BraintreeDropInResult {

  const BraintreeDropInResult(
      {required this.paymentMethodNonce,
      required this.deviceData,
      this.billingAddress,
      this.shippingAddress,
      this.firstName = "",
      this.lastName="",
      this.email="",
      this.phone=""});

  factory BraintreeDropInResult.fromJson(dynamic source) {
    return BraintreeDropInResult(
      paymentMethodNonce: BraintreePaymentMethodNonce.fromJson(source['paymentMethodNonce']),
      deviceData: source['deviceData'],
      billingAddress: BraintreePostalAddress.fromJson(source['billingAddress']),
      shippingAddress: BraintreePostalAddress.fromJson(source['shippingAddress']),
      firstName: source['firstName'] != null ? source['firstName']:"",
      lastName: source['lastName'] != null ? source['lastName']: "",
      email: source['email' != null? source['email']]: "",
      phone: source['phone'] != null ? source['phone']:"",
    );
  }

  /// The payment method nonce containing all relevant information for the payment.
  final BraintreePaymentMethodNonce paymentMethodNonce;

  /// String of device data. `null`, if `collectDeviceData` was set to false.

  final String deviceData;

  /// The payment billing address.
  final BraintreePostalAddress? billingAddress;

  /// The payment shipping address.
  final BraintreePostalAddress? shippingAddress;

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
}

class BraintreePaymentMethodNonce {
  const BraintreePaymentMethodNonce({
    required this.nonce,
    required this.typeLabel,
    required this.description,
    required this.isDefault,
    this.paypalPayerId,
  });

  factory BraintreePaymentMethodNonce.fromJson(dynamic source) {
    return BraintreePaymentMethodNonce(
      nonce: source['nonce'],
      typeLabel: source['typeLabel'],
      description: source['description'],
      isDefault: source['isDefault'],
      paypalPayerId: source['paypalPayerId'],
    );
  }

  /// The nonce generated for this payment method by the Braintree gateway. The nonce will represent
  /// this PaymentMethod for the purposes of creating transactions and other monetary actions.
  final String nonce;

  /// The type of this PaymentMethod for displaying to a customer, e.g. 'Visa'. Can be used for displaying appropriate logos, etc.
  final String typeLabel;

  /// The description of this PaymentMethod for displaying to a customer, e.g. 'Visa ending in...'.
  final String description;

  /// True if this payment method is the default for the current customer, false otherwise.
  final bool isDefault;

  /// PayPal payer id if requesting for paypal nonce
  final String? paypalPayerId;
}

class BraintreePostalAddress {
  const BraintreePostalAddress({
    required this.streetAddress,
    required this.extendedAddress,
    required this.locality,
    required this.countryCodeAlpha2,
    required this.postalCode,
    required this.region,
  });

  factory BraintreePostalAddress.fromJson(dynamic source) {
    if (source == null) return BraintreePostalAddress(streetAddress:"", extendedAddress:"", locality: "",countryCodeAlpha2: "", postalCode: "",region: "");
    return BraintreePostalAddress(
      streetAddress: source['streetAddress'],
      extendedAddress: source['extendedAddress'],
      locality: source['locality'],
      countryCodeAlpha2: source['countryCodeAlpha2'],
      postalCode: source['postalCode'],
      region: source['region'],
    );
  }

  final String streetAddress;
  final String extendedAddress;
  final String locality;
  final String countryCodeAlpha2;
  final String postalCode;
  final String region;
}
