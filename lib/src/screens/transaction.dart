import 'package:flutter/material.dart';
import 'package:klearcard_app/src/model/expense_model.dart';
import 'package:klearcard_app/src/provider/expense_provider.dart';
import 'package:klearcard_app/src/theme/styles.dart';
import 'package:klearcard_app/src/widgets/transcation_display_widget.dart';
import 'package:provider/provider.dart';

class Transcation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseProvider>(
      builder: (context, expenseProvider, _) {
        final List<TransactionModel> list = expenseProvider.expenseList;
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 5,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Transactions",
                      style: KStyles.headerBoldStyle.copyWith(fontSize: 20),
                    ),
                    Icon(
                      Icons.sort,
                      size: 30,
                      color: Colors.black45,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: _buildTranscationItems(list, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///Calculating the [totalAmount] & displaying all the `Tiles` here

  List<Widget> _buildTranscationItems(
      List<TransactionModel> list, BuildContext context) {
    return list.map(
      (transactionModel) {
        return TransactionDisplay(transactionModel: transactionModel);
      },
    ).toList();
  }
}
