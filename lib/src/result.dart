import 'package:meta/meta.dart';

class BraintreeDropInResult {
  const BraintreeDropInResult({
    @required this.paymentMethodNonce,
    @required this.deviceData,
    this.billingAddress
  });

  factory BraintreeDropInResult.fromJson(dynamic source) {
    if (source == null) return null;
    return BraintreeDropInResult(
      paymentMethodNonce:
          BraintreePaymentMethodNonce.fromJson(source['paymentMethodNonce']),
      deviceData: source['deviceData'],
      billingAddress: BraintreePostalAddress.fromJson(source['billingAddress'])
    );
  }

  /// The payment method nonce containing all relevant information for the payment.
  final BraintreePaymentMethodNonce paymentMethodNonce;

  /// String of device data. `null`, if `collectDeviceData` was set to false.
  final String deviceData;

  /// The payment billing address.
  final BraintreePostalAddress billingAddress;
}

class BraintreePaymentMethodNonce {
  const BraintreePaymentMethodNonce({
    @required this.nonce,
    @required this.typeLabel,
    @required this.description,
    @required this.isDefault,
  });

  factory BraintreePaymentMethodNonce.fromJson(dynamic source) {
    if (source == null) return null;
    return BraintreePaymentMethodNonce(
      nonce: source['nonce'],
      typeLabel: source['typeLabel'],
      description: source['description'],
      isDefault: source['isDefault'],
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
}

class BraintreePostalAddress {
  const BraintreePostalAddress({
    @required this.streetAddress,
    @required this.extendedAddress,
    @required this.locality,
    @required this.countryCodeAlpha2,
    @required this.postalCode,
    @required this.region,
  });

  factory BraintreePostalAddress.fromJson(dynamic source) {
    if (source == null) return null;
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
