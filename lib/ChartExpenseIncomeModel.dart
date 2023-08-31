class ChartExpenseIncomeModel {
  ChartExpenseIncomeModel({
    this.income,
    this.expense,
  });

  ChartExpenseIncomeModel.fromJson(dynamic json) {
    if (json['income'] != null) {
      income = [];
      json['income'].forEach((v) {
        income?.add(Income.fromJson(v));
      });
    }
    if (json['expense'] != null) {
      expense = [];
      json['expense'].forEach((v) {
        expense?.add(Expense.fromJson(v));
      });
    }
  }
  List<Income>? income;
  List<Expense>? expense;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (income != null) {
      map['income'] = income?.map((v) => v.toJson()).toList();
    }
    if (expense != null) {
      map['expense'] = expense?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Expense {
  Expense({
    this.month,
    this.amount,
  });

  Expense.fromJson(dynamic json) {
    month = json['month'];
    amount = json['amount'];
  }
  String? month;
  num? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['amount'] = amount;
    return map;
  }
}

class Income {
  Income({
    this.month,
    this.amount,
  });

  Income.fromJson(dynamic json) {
    month = json['month'];
    amount = json['amount'];
  }
  String? month;
  num? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['month'] = month;
    map['amount'] = amount;
    return map;
  }
}
