import 'package:flutter/material.dart';
import 'package:klearcard_app/src/theme/styles.dart';

class WalletCard extends StatelessWidget {
  final double height;
  final double width;
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;
  final double amount;
  final String color;
  final String cardType;

  const WalletCard({
    Key key,
    this.height,
    this.width,
    @required this.amount,
    @required this.color,
    @required this.cardType,
    @required this.cardNumber,
    @required this.expiryDate,
    @required this.cardHolderName,
    @required this.cvvCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: this.height ?? 200,
      width: this.width ?? 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(
          int.parse(color),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildHolderRow(),
            _buildCardNumber(),
            _buildBottomRow(),
          ],
        ),
      ),
    );
  }

  /// Building `header` row for the Card

  Widget _buildHolderRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.cardHolderName, style: KStyles.titleName),
            SizedBox(height: 5.0),
            _buildAmount(),
          ],
        ),
        _icon(),
      ],
    );
  }

  Widget _icon() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        Icons.info_outline,
        size: 20,
        color: Colors.white,
      ),
    );
  }

  /// Amount
  Text _buildAmount() {
    return Text(
      "S\$${amount.toStringAsFixed(2)}",
      style: KStyles.amountStyle,
    );
  }

  ///build Card Number
  Widget _buildCardNumber() {
    final String lastFourDigits = cardNumber.substring(11, 15);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("****", style: KStyles.cardNumStyle),
        Text("****", style: KStyles.cardNumStyle),
        Text("****", style: KStyles.cardNumStyle),
        Text("${lastFourDigits.toLowerCase()}", style: KStyles.cardNumStyle),
      ],
    );
  }

  /// build Card Type & Valid through row
  Widget _buildBottomRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("CARD TYPE", style: KStyles.smallTitle),
            SizedBox(height: 5.0),
            Text(
              cardType,
              style: KStyles.mediumTitle,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("VALID THRU", style: KStyles.smallTitle),
            SizedBox(height: 5.0),
            Text(
              expiryDate,
              style: KStyles.mediumTitle,
            ),
          ],
        )
      ],
    );
  }
}
