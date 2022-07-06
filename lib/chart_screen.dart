import 'dart:developer';

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Chart'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 150, 136, 1),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                onPressed: () {
                  log('Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCartesianChart()));
                },
                child: const Text(
                  'SfCartesianChart \n LineSeries',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 150, 136, 1),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                onPressed: () {
                  log('Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MySpineLineChart()));
                },
                child: const Text(
                  'SfCartesianChart \n SpineLine',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(0, 150, 136, 1),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                onPressed: () {
                  log('Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCandle()));
                },
                child: const Text(
                  'SfCartesianChart \n CandleLines',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 17, 22, 22),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                onPressed: () {
                  log('Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyCircularChart()));
                },
                child: const Text(
                  'SfCircular Chart ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 102, 126, 175),
                  onPrimary: Colors.white,
                  shadowColor: Colors.red,
                  elevation: 5,
                ),
                onPressed: () {
                  log('Pressed');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyRadialGauges()));
                },
                child: const Text(
                  'SfRadialGuages ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
