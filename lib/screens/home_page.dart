import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart for charts
import 'admin_dashboard.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSummaryCard('Total Earnings', '\$500,000', context),
              _buildSummaryCard('Vendors', '45', context),
            ],
          ),
          const SizedBox(height: 20),
          // _buildGraphCard('Revenue Made', LineChartWidget(
          //   spots: const [
          //     FlSpot(0, 1),
          //     FlSpot(1, 3),
          //     FlSpot(2, 2),
          //     FlSpot(3, 5),
          //     FlSpot(4, 4),
          //   ],
          // )),
          const SizedBox(height: 10),
          _buildGraphCard('Products Sold', BarChartWidget(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 5, color: Colors.teal)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 3, color: Colors.teal)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 4, color: Colors.teal)]),
            ],
          )),
          const SizedBox(height: 10),
          _buildGraphCard('Vendor Activity', BarChartWidget(
            barGroups: [
              BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 7, color: Colors.teal)]),
              BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 6, color: Colors.teal)]),
              BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 8, color: Colors.teal)]),
            ],
          )),
          const SizedBox(height: 10),
          _buildGraphCard('Upcoming QBR', const Text("QBR scheduled for next quarter")),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(String title, String value, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGraphCard(String title, Widget graph) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            graph,
          ],
        ),
      ),
    );
  }
}
