import 'package:flutter/material.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Example Inventory Items
            _buildInventoryItem(
              context,
              category: "Electronics",
              productName: "Smartphone",
              brandName: "Brand A",
              quantity: "10",
            ),
            const SizedBox(height: 10),
            _buildInventoryItem(
              context,
              category: "Home Appliances",
              productName: "Microwave",
              brandName: "Brand B",
              quantity: "5",
            ),
            const SizedBox(height: 10),
            _buildInventoryItem(
              context,
              category: "Furniture",
              productName: "Chair",
              brandName: "Brand C",
              quantity: "20",
            ),
            const SizedBox(height: 10),
            _buildInventoryItem(
              context,
              category: "Electronics",
              productName: "Laptop",
              brandName: "Brand D",
              quantity: "8",
            ),
            const SizedBox(height: 10),
            _buildInventoryItem(
              context,
              category: "Toys",
              productName: "Action Figure",
              brandName: "Brand E",
              quantity: "15",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryItem(BuildContext context,
      {required String category,
        required String productName,
        required String brandName,
        required String quantity}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Category: $category",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Product Name: $productName",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "Brand: $brandName",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              "Quantity: $quantity",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
