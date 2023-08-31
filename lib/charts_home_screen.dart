import 'package:flutter/material.dart';
import 'package:syncfusion_charts/SF_Gauges/radial_gauges.dart';
import 'package:syncfusion_charts/sf_charts/CartesianCharts/candle_series.dart';
import 'package:syncfusion_charts/sf_charts/CartesianCharts/sf_cartesian_chart.dart';
import 'package:syncfusion_charts/sf_charts/CartesianCharts/spine_chart.dart';
import 'package:syncfusion_charts/sf_charts/sf_circular_chart.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Chart'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          // mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              name: "LineSeries",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCartesianChart(),
                  )),
            ),
            CustomButton(
              name: "SpineLines",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MySpineLineChart(),
                  )),
            ),
            CustomButton(
              name: "CandleLines",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCandle(),
                  )),
            ),
            CustomButton(
              name: "PieChart",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyCircularChart(),
                  )),
            ),
            CustomButton(
              name: "RadialGauges",
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyRadialGauges(),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String name;
  final void Function() onPressed;
  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
