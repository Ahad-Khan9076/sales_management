import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  final List<Map<String, String>> orders = const [
    {"title": "Order #1001", "description": "Product A, Product B", "price": "\$50.00"},
    {"title": "Order #1002", "description": "Product C, Product D", "price": "\$120.00"},
    {"title": "Order #1003", "description": "Product E", "price": "\$30.00"},
    {"title": "Order #1004", "description": "Product F, Product G", "price": "\$200.00"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Orders"),
      //   backgroundColor: Colors.teal,
      // ),
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
                  order["title"]!,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2), // Adds spacing between title and description
                    Text(
                      order["description"]!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 4), // Adds spacing between description and price
                    Text(
                      order["price"]!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6), // Adds spacing at the bottom
                  ],
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.teal.shade200,
                  child: Text(
                    order["title"]!.split('#').last,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
            ),
          );
        },
      ),
    );
  }
}
