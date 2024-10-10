import 'package:flutter/material.dart';

import 'order_details_screen.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  final List<Map<String, String>> orders = const [
    {
      "orderNumber": "1001",
      "customerName": "John Doe",
      "date": "2024-10-01",
      "price": "\$50.00",
      "status": "Delivered",
    },
    {
      "orderNumber": "1002",
      "customerName": "Alice Smith",
      "date": "2024-09-28",
      "price": "\$120.00",
      "status": "Shipped",
    },
    {
      "orderNumber": "1003",
      "customerName": "Bob Johnson",
      "date": "2024-09-21",
      "price": "\$30.00",
      "status": "Pending",
    },
    {
      "orderNumber": "1004",
      "customerName": "David Brown",
      "date": "2024-09-15",
      "price": "\$200.00",
      "status": "Cancelled",
    },
    {
      "orderNumber": "1004",
      "customerName": "David Brown",
      "date": "2024-09-15",
      "price": "\$200.00",
      "status": "Cancelled",
    },
    {
      "orderNumber": "1005",
      "customerName": "David Brown",
      "date": "2024-09-15",
      "price": "\$200.00",
      "status": "Cancelled",
    },
    {
      "orderNumber": "1004",
      "customerName": "David Brown",
      "date": "2024-09-15",
      "price": "\$200.00",
      "status": "Cancelled",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: orders.length,
        padding: const EdgeInsets.all(10.0),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
                title: Text(
                  order["customerName"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2), // Spacing between title and date
                    Text(
                      order["date"]!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4), // Spacing between date and price
                    Text(
                      order["price"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6), // Spacing at the bottom
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade200,
                  child: Text(
                    order["orderNumber"]!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsScreen(order: order),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
