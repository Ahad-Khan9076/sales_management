import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Product 1',
      'subtitle': 'Description for Product 1',
      'price': 29.99,
      'rating': 4.5,
    },
    {
      'name': 'Product 2',
      'subtitle': 'Description for Product 2',
      'price': 19.99,
      'rating': 4.0,
    },
    {
      'name': 'Product 3',
      'subtitle': 'Description for Product 3',
      'price': 49.99,
      'rating': 5.0,
    },
  ];

  void _showFilterOptions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Filter Products'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Filter by Name'),
                onTap: () {
                  // Implement filter by name logic
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
              ListTile(
                title: const Text('Filter by Price'),
                onTap: () {
                  // Implement filter by price logic
                  Navigator.of(context).pop(); // Close dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Placeholder for App Bar area
            const SizedBox(height: 10), // Leave space as a placeholder for the app bar
            // Row for the Filter Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Aligns the icon to the right
              children: [
                IconButton(
                  icon: const Icon(Icons.filter_list, size: 30, color: Colors.black),
                  onPressed: _showFilterOptions,
                  tooltip: 'Filter Products',
                ),
              ],
            ),
            const SizedBox(height: 16), // Space between icon and product list
            // Product List
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.only(bottom: 16.0), // Space between cards
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Circular Avatar Placeholder
                          const CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.blueGrey, // Placeholder color
                            child: Text(
                              'P', // Placeholder text
                              style: TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          const SizedBox(height: 16), // Space between avatar and text
                          Text(
                            product['name'],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4), // Space between name and subtitle
                          Text(
                            product['subtitle'],
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 8), // Space between subtitle and price
                          Text(
                            '\$${product['price'].toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Rating Stars
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: List.generate(
                                5,
                                    (starIndex) {
                                  return Icon(
                                    starIndex < product['rating']
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.amber,
                                    size: 18,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
