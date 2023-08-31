import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyRadialGauges extends StatefulWidget {
  const MyRadialGauges({Key? key}) : super(key: key);

  @override
  State<MyRadialGauges> createState() => _MyRadialGaugesState();
}

class _MyRadialGaugesState extends State<MyRadialGauges> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RadialGauges'),
        ),
        body: Center(
            child: SfRadialGauge(
          backgroundColor: Colors.transparent,
          title: const GaugeTitle(
              text: 'Speedometer',
              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          enableLoadingAnimation: true,
          animationDuration: 4500,
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 150,
              pointers: const <GaugePointer>[
                NeedlePointer(
                  value: 90,
                  enableAnimation: true,
                ),
              ],
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.green),
                GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                GaugeRange(startValue: 100, endValue: 150, color: Colors.red),
              ],
              annotations: const <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '90.0 MPH',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }
}
