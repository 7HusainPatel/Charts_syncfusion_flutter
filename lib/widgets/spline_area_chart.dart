import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'common_Sf_cartesian_chart.dart';
import 'line_chart.dart';

class SplineAreaChart extends StatefulWidget {
  const SplineAreaChart({super.key});

  @override
  State<SplineAreaChart> createState() => _SplineAreaChartState();
}

class _SplineAreaChartState extends State<SplineAreaChart> {
  ChartAxis? chartAxis;
  final List<ChartData> chartData = [
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
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Income"),
              // ToggleButtonsSample(
              //   calenderString: (EnumToggleCalender) {},
              // )
              // SingleChoiceSegment()
            ],
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height / 3.5,
            width: MediaQuery.of(context).size.width,
            child: _buildSplineAreaChart())
      ],
    );
  }

  CommonSfCartesianChart _buildSplineAreaChart() {
    return CommonSfCartesianChart(series: <ChartSeries>[
      SplineAreaSeries<ChartData, String>(
        borderColor: Colors.purple,
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y,
        borderWidth: 3,
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.purple.shade200,
        ], begin: Alignment.topLeft),
        // markerSettings: const MarkerSettings(
        //   color: Colors.purple,
        //   isVisible: true,
        // ),
      ),
    ]);
  }
}
