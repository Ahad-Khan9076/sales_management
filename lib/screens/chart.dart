import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// LineChartWidget takes a list of FlSpot
class LineChartWidget extends StatelessWidget {
  final List<FlSpot> spots;

  const LineChartWidget({Key? key, required this.spots}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.teal,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}

// BarChartWidget takes a list of BarChartGroupData
class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;

  const BarChartWidget({Key? key, required this.barGroups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: barGroups,
        ),
      ),
    );
  }
}
