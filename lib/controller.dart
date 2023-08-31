import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:syncfusion_charts/ChartExpenseIncomeModel.dart';

class APIController {
  List<Income> _listIncome = [];
  List<Expense> _listExpense = [];

  getChartDataAPI() async {
    var response = await Dio()
        .get("https://mocki.io/v1/948d1998-2dcb-4e21-b0c8-b61baa18a33d");
    if (response.statusCode == 200) {
      var json = response.data;
      var result = ChartExpenseIncomeModel.fromJson(json);

      for (var element in result.expense!) {
        listExpense.add(element);
      }

      for (var element in result.income!) {
        listIncome.add(element);
      }

      if (kDebugMode) {
        print(result.expense!.length);
      }
    }
  }

  List<Expense> get listExpense => _listExpense;

  set listExpense(List<Expense> value) {
    _listExpense = value;
  }

  List<Income> get listIncome => _listIncome;

  set listIncome(List<Income> value) {
    _listIncome = value;
  }
}
