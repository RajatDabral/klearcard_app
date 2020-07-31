import 'package:flutter/material.dart';
import 'package:klearcard_app/src/helper/calendar_helper.dart';
import 'package:klearcard_app/src/model/expense_model.dart';
import 'package:klearcard_app/src/provider/expense_provider.dart';
import 'package:klearcard_app/src/theme/styles.dart';
import 'package:klearcard_app/src/widgets/transcaction_tile.dart';
import 'package:provider/provider.dart';

class TransactionDisplay extends StatefulWidget {
  final TransactionModel transactionModel;

  const TransactionDisplay({Key key, this.transactionModel}) : super(key: key);
  @override
  _TransactionDisplayState createState() => _TransactionDisplayState();
}

class _TransactionDisplayState extends State<TransactionDisplay> {
  Future<void> calculateAmount() async {
    await Provider.of<ExpenseProvider>(context, listen: false)
        .calculateTotal(widget.transactionModel.expense);
  }

  @override
  void initState() {
    super.initState();
    calculateAmount();
  }

  @override
  Widget build(BuildContext context) {
    final totalAmount =
        Provider.of<ExpenseProvider>(context, listen: false).totalAmount;
    final amount1 = totalAmount.toStringAsFixed(0);
    final amount2 = totalAmount.toStringAsFixed(2).split(".")[1];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: MediaQuery.of(context).size.height * .30,
      // color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                CalendarHelper.checkDate(widget.transactionModel.date),
                style: KStyles.titleName.copyWith(
                  color: Colors.grey[400],
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              RichText(
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
            ],
          ),
          ...widget.transactionModel.expense.map(
            (expenseModel) => TransactionTile(
              title: expenseModel.title,
              image: expenseModel.image,
              desc: expenseModel.desc,
              amount: expenseModel.amount,
            ),
          )
        ],
      ),
    );
  }
}
