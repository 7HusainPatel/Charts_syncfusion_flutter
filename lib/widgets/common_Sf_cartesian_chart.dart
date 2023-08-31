import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CommonSfCartesianChart extends StatelessWidget {
  final dynamic series;
  const CommonSfCartesianChart({super.key, required this.series});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      margin: const EdgeInsets.all(20),
      tooltipBehavior: TooltipBehavior(enable: true),
      //X-Axis
      primaryXAxis: CategoryAxis(
        interval: 1,
        majorGridLines: const MajorGridLines(width: 0),
        axisLine: AxisLine(
          width: 1,
          color: Colors.grey[400],
          dashArray: <double>[5, 5],
        ),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
      ),
      //Y-Axis
      primaryYAxis: NumericAxis(
        majorGridLines: MajorGridLines(
            width: 1, color: Colors.grey[400], dashArray: const <double>[5, 5]),
        labelFormat: '{value}k',
        interval: 2,
        minimum: 0,
        axisLine: const AxisLine(width: 0),
        majorTickLines: const MajorTickLines(color: Colors.transparent),
        numberFormat: NumberFormat.compact(),
      ),
      series: series,
    );
  }
}
