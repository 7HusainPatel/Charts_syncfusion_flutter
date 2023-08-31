import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

class RadialChart extends StatelessWidget {
  RadialChart({super.key});
  final List<ChartData> chartData = [
    ChartData('EXPENSE', 66.6, Colors.blue),
    ChartData('INCOME', 29.7, Colors.green),
    ChartData('SAVINGS', 33.21, Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: SfCircularChart(
        legend: Legend(
          isVisible: true,
          alignment: ChartAlignment.near,
          position: LegendPosition.left,
          isResponsive: true,
          title: const LegendTitle(
              text: "   Static",
              textStyle: TextStyle(fontSize: 20),
              alignment: ChartAlignment.near),
          legendItemBuilder: (legendText, series, point, seriesIndex) {
            return SizedBox(
              width: 100,
              // color: Colors.red,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        color: chartData[seriesIndex].color,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        chartData[seriesIndex].x,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "${chartData[seriesIndex].y.toString()}%",
                        textAlign: TextAlign.end,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
        // margin: EdgeInsets.symmetric(vertical: 20),
        series: <CircularSeries>[
          // Renders radial bar chart
          RadialBarSeries<ChartData, String>(
              innerRadius: "20%",
              gap: '20%',
              // strokeWidth: 100.0,
              cornerStyle: CornerStyle.bothCurve,
              maximumValue: 100,

              // useSeriesColor: true,
              // trackOpacity: 0.3,
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointColorMapper: (ChartData data, _) => data.color),
        ],
      ),
    );
  }
}
