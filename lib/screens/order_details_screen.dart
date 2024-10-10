import 'package:flutter/material.dart';
import 'edit_order_screen.dart'; // Make sure to import the EditOrderScreen

class OrderDetailsScreen extends StatelessWidget {
  final Map<String, String> order;

  const OrderDetailsScreen({Key? key, required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Navigate to EditOrderScreen with the current order details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditOrderScreen(order: order),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              _buildProductTable(),
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
    return Card(
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
            const Divider(),
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
