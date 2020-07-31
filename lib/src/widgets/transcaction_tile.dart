import 'package:flutter/material.dart';
import 'package:klearcard_app/src/theme/styles.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String image;
  final String desc;
  final double amount;

  const TransactionTile({
    Key key,
    @required this.title,
    @required this.image,
    @required this.desc,
    @required this.amount,
  }) : super(key: key);

  ///[Calculating decimal] for styling here `amount1` is the amount before the decimal
  ///`amount2` is the amount after the decimal
  ///`topPadding` calculates the top padding of the tile, which is `10%` of the height
  ///of the Tile, so to `align` the [amount] with title
  ///
  ///eg: if `total` of the tile is `100` then [topPadding] will be `10%` of it. i.e `10`

  @override
  Widget build(BuildContext context) {
    final amount1 = amount.toStringAsFixed(0);
    final amount2 = amount.toStringAsFixed(2).split(".")[1];
    final topPadding = MediaQuery.of(context).size.height * 0.01;
    return Container(
      height: MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      // color: Colors.yellow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5),
                    height: MediaQuery.of(context).size.height * 0.080,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[300],
                    ),
                    child: Image.asset(
                      image,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.090,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: KStyles.titleName.copyWith(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor * 0.9,
                            maxLines: 2,
                          ),
                          Text(
                            desc,
                            style: KStyles.smallTitle.copyWith(
                              fontSize: 15,
                              color: Colors.grey[400],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: amount1,
                    style: KStyles.amountStyle.copyWith(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  TextSpan(
                    text: ".$amount2 S\$",
                    style: KStyles.amountStyle.copyWith(
                      color: Colors.black12,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
