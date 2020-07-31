class TransactionModel {
  final int id;
  final DateTime date;
  final List<ExpenseModel> expense;

  TransactionModel({
    this.id,
    this.date,
    this.expense,
  });

  TransactionModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        date = DateTime.parse(parsedJson["date"]),
        expense = List<ExpenseModel>.from(
          parsedJson["expense"].map(
            (expenseModel) => ExpenseModel.fromJson(expenseModel),
          ),
        );
}

class ExpenseModel {
  final int id;
  final String title;
  final String desc;
  final double amount;
  final String image;
  final String type;

  ExpenseModel({
    this.id,
    this.title,
    this.desc,
    this.amount,
    this.image,
    this.type,
  });

  ExpenseModel.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson["id"],
        title = parsedJson["title"],
        desc = parsedJson["description"],
        amount = parsedJson["amount"],
        image = parsedJson["image"],
        type = parsedJson["type"];
}
