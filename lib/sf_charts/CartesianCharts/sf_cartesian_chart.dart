import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widgets/line_chart.dart';

class MyCartesianChart extends StatefulWidget {
  const MyCartesianChart({Key? key}) : super(key: key);

  @override
  State<MyCartesianChart> createState() => _MyCartesianChartState();
}

class _MyCartesianChartState extends State<MyCartesianChart> {
  //3set data
  late List<SalesData> _chartData;

  @override
  void initState() {
    //4,initialized
    _chartData = getChartData();
    log('Chat Data-->$_chartData');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
          title: const Text('Line Chart'),
        ),
        body: Column(
          children: [
            SfCartesianChart(
              enableAxisAnimation: true,
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Data analysis'),
              legend: const Legend(
                isVisible: true,
              ),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // enableTooltip: true,
                  name: 'sales',
                  dataSource: _chartData,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    color: Colors.blue,
                  ),
                ),
                LineSeries(
                  name: 'purchase',
                  dataSource: _chartData,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.purchase,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    color: Color.fromARGB(255, 126, 19, 19),
                  ),
                ),
              ],
            ),
            const LineChart(),
          ],
        ),
      ),
    );
  }

  //2, get
  List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData('January', 11, 14),
      SalesData('February', 14, 19),
      SalesData('March', 23, 12),
      SalesData('April', 12, 31),
      SalesData('May', 30, 11),
      SalesData('Jun', 25, 15),
    ];
    return chartData;
  }
}

//1.create model class for data
class SalesData {
  SalesData(this.month, this.sales, this.purchase);
  final String month;
  final double sales;
  final double purchase;
}
