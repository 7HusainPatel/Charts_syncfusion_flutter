import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../widgets/spline_area_chart.dart';

class MySpineLineChart extends StatefulWidget {
  const MySpineLineChart({Key? key}) : super(key: key);

  @override
  State<MySpineLineChart> createState() => _MySpineLineChartState();
}

class _MySpineLineChartState extends State<MySpineLineChart> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 150, 136, 1),
        title: const Text('SpineLine Chart'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: SfCartesianChart(
              legend: Legend(isVisible: true),
              primaryXAxis: CategoryAxis(),
              series: <ChartSeries>[
                SplineSeries<SalesData, String>(
                  dataSource: _chartData,
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                  splineType: SplineType.cardinal,
                )
              ],
            ),
          ),
          const Divider(
            height: 10,
            thickness: 2,
          ),
          const SplineAreaChart(),
        ],
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

class SalesData {
  SalesData(this.month, this.sales, this.purchase);
  final String month;
  final double sales;
  final double purchase;
}
