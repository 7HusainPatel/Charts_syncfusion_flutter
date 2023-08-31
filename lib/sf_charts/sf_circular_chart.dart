import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../widgets/radial_chart.dart';

class MyCircularChart extends StatefulWidget {
  const MyCircularChart({Key? key}) : super(key: key);

  @override
  State<MyCircularChart> createState() => _MyCircularChartState();
}

class _MyCircularChartState extends State<MyCircularChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true, elevation: 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 102, 126, 175),
          title: const Text('Cartesian Chart'),
        ),
        body: Column(
          children: [
            SfCircularChart(
              title: ChartTitle(text: 'Continent wise GDP - 2021'),
              tooltipBehavior: _tooltipBehavior,
              legend: const Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              series: <CircularSeries>[
                PieSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData data, _) => data.continent,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    dataLabelSettings: const DataLabelSettings(isVisible: true))
              ],
            ),
            const Divider(
              height: 10,
              thickness: 2,
            ),
            RadialChart(),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('Oceania', 1600),
      GDPData('Africa', 2490),
      GDPData('S America', 2900),
      GDPData('Europe', 23050),
      GDPData('N America', 24880),
      GDPData('Asia', 34390),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
