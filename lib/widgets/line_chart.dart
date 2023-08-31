import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_charts/widgets/pb_toggle_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../ChartExpenseIncomeModel.dart';
import '../controller.dart';
import 'common_Sf_cartesian_chart.dart';

class LineChart extends StatefulWidget {
  final String? refCode;
  const LineChart({Key? key, this.refCode}) : super(key: key);

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  final List<bool> selectedToggle = <bool>[false, false, true];
  final List<ChartData> listYearChartData = [
    ChartData('Jan', 1, 3),
    ChartData('Feb', 2, 4),
    ChartData('Mar', 4, 7),
    ChartData('Apr', 3, 8),
    ChartData('May', 5, 3),
    ChartData('Jun', 3, 8),
    ChartData('Jul', 6, 6),
    ChartData('Aug', 7, 6),
    ChartData('Sep', 7, 8),
  ];

  final List<ChartData> listMonthChartData = [
    ChartData('01 Aug', 1, 3),
    ChartData('02 Aug', 4, 1),
    ChartData('03 Aug', 5, 2),
    ChartData('04 Aug', 3, 8),
    ChartData('05 Aug', 2, 3),
    ChartData('06 Aug', 4, 2),
    ChartData('07 Aug', 6, 8),
    ChartData('08 Aug', 8, 4),
    ChartData('09 Aug', 9, 8),
    ChartData('10 Aug', 1, 5),
  ];

  final List<ChartData> listWeekChartData = [
    ChartData('Sun', 3, 3),
    ChartData('Mon', 6, 2),
    ChartData('Tue', 7, 4),
    ChartData('Wed', 1, 5),
    ChartData('Thu', 4, 8),
    ChartData('Fri', 2, 7),
    ChartData('Sat', 8, 3),
  ];

  List<ChartData> listDataSource = [
    ChartData('Jan', 1, 3),
    ChartData('Feb', 2, 4),
    ChartData('Mar', 4, 7),
    ChartData('Apr', 3, 8),
    ChartData('May', 5, 3),
    ChartData('Jun', 3, 8),
    ChartData('Jul', 6, 6),
    ChartData('Aug', 7, 6),
    ChartData('Sep', 7, 8),
  ];
  final APIController _apiController = APIController();

  @override
  void initState() {
    super.initState();
    // listDataSource = listYearChartData;
    // listDataSource = listMonthChartData;
    // listDataSource = listWeekChartData;
    fetchData();

    log("message${_apiController.listIncome.length}");
  }

  fetchData() async {
    await _apiController.getChartDataAPI();
    setState(() {});
  }

  @override
  void dispose() {
    // listYearChartData.clear();
    // listMonthChartData.clear();
    // listWeekChartData.clear();
    _apiController.listExpense.clear();
    _apiController.listIncome.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(
          height: 10,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Income vs Expense"),
              ToggleButtonsSample(
                isSelected: selectedToggle,
                onPressed: (int index) {
                  print("Index is : $index");
                  setState(() {
                    for (int i = 0; i < selectedToggle.length; i++) {
                      selectedToggle[i] = i == index;
                    }
                    listDataSource.clear();
                    if (selectedToggle[0] == true) {
                      //listDataSource.clear();
                      listDataSource.addAll(listWeekChartData);
                    }
                    if (selectedToggle[1] == true) {
                      // listDataSource.clear();

                      listDataSource.addAll(listMonthChartData);
                    }
                    if (selectedToggle[2] == true) {
                      print("in year : ${listYearChartData.length}");

                      listDataSource.addAll(listYearChartData);
                    }
                  });
                },
              ),
              // SingleChoiceSegment()
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          width: MediaQuery.of(context).size.width,
          child: _buildDefaultLineChart(),
        )
      ],
    );
  }

  /// Get the cartesian chart with default line series
  CommonSfCartesianChart _buildDefaultLineChart() {
    return CommonSfCartesianChart(
      series: <LineSeries<dynamic, String>>[
        LineSeries<Income, String>(
          animationDuration: 2500,
          dataSource: _apiController.listIncome,
          xValueMapper: (Income sales, _) => sales.month,
          yValueMapper: (Income sales, _) => sales.amount,
          width: 2,
          name: 'Income',
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.red,
          ),
          color: Colors.red,
        ),
        LineSeries<Expense, String>(
          animationDuration: 2500,
          dataSource: _apiController.listExpense,
          width: 2,
          name: 'Expense',
          xValueMapper: (Expense sales, _) => sales.month,
          yValueMapper: (Expense sales, _) => sales.amount,
          markerSettings:
              const MarkerSettings(isVisible: true, color: Colors.green),
          color: Colors.green,
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y2);
  final String x;
  final double y;
  final double y2;
}
