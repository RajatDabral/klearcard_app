import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:klearcard_app/src/model/wallet_card_model.dart';

class WalletProvider with ChangeNotifier {
  //List of cards user have.
  final List<WalletCardModel> _cards = [
    WalletCardModel(
        cardHolderName: "Davy Jones",
        cardNumber: "1000200030004000",
        cvvCode: "123",
        expiryDate: "12/22",
        showBackView: false,
        color: "0xff3B556E",
        amount: 2020.00,
        cardType: "MASTER"),
    WalletCardModel(
        cardHolderName: "Captain Jack",
        cardNumber: "43212678939004000",
        cvvCode: "101",
        expiryDate: "12/25",
        showBackView: false,
        color: "0xffD6904D",
        amount: 1020.00,
        cardType: "VIRTUAL"),
    WalletCardModel(
        cardHolderName: "Dark Lord",
        cardNumber: "8979525263639641",
        cvvCode: "552",
        expiryDate: "11/23",
        showBackView: false,
        color: "0xff7A132E",
        amount: 1890.90,
        cardType: "VISA"),
  ];

  //getter for List of cards
  List<WalletCardModel> get cards => _cards;
}
