import 'package:flutter/cupertino.dart';
import 'package:klearcard_app/src/dummyJson/dummy_data.dart';
import 'package:klearcard_app/src/model/expense_model.dart';

class ExpenseProvider with ChangeNotifier {
  List<TransactionModel> _expenseList = [];
  double _totalAmount;

  List<TransactionModel> get expenseList => List.from(_expenseList);
  double get totalAmount => _totalAmount;

  void fetchData() {
    DummyData.expenseList.forEach((element) {
      _expenseList.add(TransactionModel.fromJson(element));
    });
  }

  ///Calcluating Total Expense here for every day
  ///transactions

  Future<void> calculateTotal(List<ExpenseModel> list) async {
    _totalAmount = 0;
    if (list.isNotEmpty)
      list.forEach((model) {
        if (model.type == "credit") {
          print("Adding");
          _totalAmount += model.amount;
        }
        if (model.type == "debit") {
          print("subtracting ");

          _totalAmount -= model.amount;
        }
      });
  }
}
