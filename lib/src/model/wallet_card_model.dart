import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WalletCardModel {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final bool showBackView;
  final String color;
  final double amount;
  final String cardType;

  WalletCardModel({
    @required this.cardNumber,
    @required this.expiryDate,
    @required this.cardHolderName,
    @required this.cvvCode,
    @required this.color,
    @required this.amount,
    @required this.cardType,
    this.showBackView = false,
  });
}
