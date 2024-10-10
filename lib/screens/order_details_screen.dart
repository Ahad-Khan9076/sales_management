import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, String> order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(  // Allow scrolling if content overflows
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle("Order Details"),
              _buildDetailRow("Order Number:", order["orderNumber"]!),
              _buildDetailRow("Customer Name:", order["customerName"]!),
              _buildDetailRow("Order Date:", order["date"]!),
              _buildDetailRow("Price:", order["price"]!),
              _buildDetailRow("Status:", order["status"]!),
              const SizedBox(height: 20),

              _buildSectionTitle("Shipping Details"),
              _buildDetailRow("Shipping Address:", "123 Main Street, City, Country"),
              _buildDetailRow("Shipping Method:", "Standard Shipping (3-5 days)"),
              _buildDetailRow("Tracking Number:", "TRK123456789"),
              const SizedBox(height: 20),

              _buildSectionTitle("Product Details"),
              _buildProductTable(),  // Use a table for product details
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Card(  // Add card for elevation and background
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 3,
              child: Text(
                value,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductTable() {
    // Sample product details, you can replace this with actual data
    final products = [
      {"name": "Product A", "quantity": "1"},
      {"name": "Product B", "quantity": "1"},
    ];

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Product Name", style: TextStyle(fontWeight: FontWeight.bold))),
                Expanded(child: Text("Quantity", style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
            const Divider(),  // Add a divider to separate headers from the content
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text(product["name"]!, style: const TextStyle(color: Colors.black54))),
                    Expanded(child: Text(product["quantity"]!, style: const TextStyle(color: Colors.black54))),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
