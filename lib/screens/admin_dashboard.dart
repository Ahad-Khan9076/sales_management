import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sales_management/screens/inventory_screen.dart';
import 'package:sales_management/screens/order_screen.dart';
import 'package:sales_management/screens/product_screen.dart';
import 'package:sales_management/screens/profile_screen.dart';

import 'home_page.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const InventoryScreen(),
    const OrdersPage(),
    const ProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        // title: const Text("Admin Dashboard"),
        centerTitle: true,
      ),
      body: _pages[_pageIndex], // Display the current page based on index
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60,
        items: const <Widget>[
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.inventory, size: 30, color: Colors.white),
          Icon(Icons.shopping_bag, size: 30, color: Colors.white),
          Icon(Icons.local_grocery_store, size: 30, color: Colors.white),
        ],
        color: Colors.teal,
        buttonBackgroundColor: Colors.teal,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}


class LineChartWidget extends StatelessWidget {
  const LineChartWidget(LineChartData lineChartData, {super.key, required List<FlSpot> spots});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 2),
                FlSpot(2, 1),
                FlSpot(3, 4),
                FlSpot(4, 2),
                FlSpot(5, 5),
              ],
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
class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key, required List<BarChartGroupData> barGroups});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: BarChart(
        BarChartData(
          barGroups: [
            BarChartGroupData(
              x: 0,
              barRods: [
                BarChartRodData(toY: 2, color: Colors.teal),
              ],
            ),
            BarChartGroupData(
              x: 2,
              barRods: [
                BarChartRodData(toY: 3, color: Colors.teal),
              ],
            ),
            BarChartGroupData(
              x: 4,
              barRods: [
                BarChartRodData(toY: 4, color: Colors.teal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
