import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:klearcard_app/src/provider/wallet_provider.dart';
import 'package:klearcard_app/src/theme/styles.dart';
import 'package:klearcard_app/src/widgets/wallet_card.dart';
import 'package:klearcard_app/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              "Wallets",
              style: KStyles.headerBoldStyle,
            ),
          ),
          SizedBox(height: 10),
          _buildCarousel(context),
          _buildDots(context),
        ],
      ),
    );
  }

  Widget _buildCarousel(BuildContext context) {
    final walletCards =
        Provider.of<WalletProvider>(context, listen: false).cards;

    return CarouselSlider(
      options: CarouselOptions(
          aspectRatio: 2.0,
          enableInfiniteScroll: false,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          }),
      items: walletCards
          .map(
            (model) => WalletCard(
              cardNumber: model.cardNumber,
              expiryDate: model.expiryDate,
              cardHolderName: model.cardHolderName,
              cvvCode: model.cvvCode,
              amount: model.amount,
              color: model.color,
              cardType: model.cardType,
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.90,
            ),
          )
          .toList(),
    );
  }

  Widget _buildDots(BuildContext context) {
    final walletCards =
        Provider.of<WalletProvider>(context, listen: false).cards;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: map<Widget>(
        walletCards,
        (index, _) {
          return _currentIndex == index
              ? Container(
                  width: 12,
                  height: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              : Container(
                  width: 4,
                  height: 4,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff989898),
                  ),
                );
        },
      ).toList(),
    );
  }
}
