import 'package:flutter/material.dart';

class EditOrderScreen extends StatefulWidget {
  final Map<String, String> order;

  const EditOrderScreen({Key? key, required this.order}) : super(key: key);

  @override
  _EditOrderScreenState createState() => _EditOrderScreenState();
}

class _EditOrderScreenState extends State<EditOrderScreen> {
  late TextEditingController orderNumberController;
  late TextEditingController customerNameController;
  late TextEditingController orderDateController;
  late TextEditingController priceController;
  late TextEditingController statusController;

  // New controllers for product and shipping details
  late TextEditingController shippingAddressController;
  late TextEditingController shippingMethodController;
  late TextEditingController trackingNumberController;
  late TextEditingController productNameController;
  late TextEditingController productQuantityController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with the order details
    orderNumberController = TextEditingController(text: widget.order["orderNumber"]);
    customerNameController = TextEditingController(text: widget.order["customerName"]);
    orderDateController = TextEditingController(text: widget.order["date"]);
    priceController = TextEditingController(text: widget.order["price"]);
    statusController = TextEditingController(text: widget.order["status"]);

    // Initialize new controllers for product and shipping details
    shippingAddressController = TextEditingController(text: widget.order["shippingAddress"]);
    shippingMethodController = TextEditingController(text: widget.order["shippingMethod"]);
    trackingNumberController = TextEditingController(text: widget.order["trackingNumber"]);
    productNameController = TextEditingController(text: widget.order["productName"]);
    productQuantityController = TextEditingController(text: widget.order["productQuantity"]);
  }

  @override
  void dispose() {
    // Dispose controllers when done
    orderNumberController.dispose();
    customerNameController.dispose();
    orderDateController.dispose();
    priceController.dispose();
    statusController.dispose();
    shippingAddressController.dispose();
    shippingMethodController.dispose();
    trackingNumberController.dispose();
    productNameController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  void _updateOrder() {
    // Collect all updated order data
    final updatedOrder = {
      "orderNumber": orderNumberController.text,
      "customerName": customerNameController.text,
      "date": orderDateController.text,
      "price": priceController.text,
      "status": statusController.text,
      "shippingAddress": shippingAddressController.text,
      "shippingMethod": shippingMethodController.text,
      "trackingNumber": trackingNumberController.text,
      "productName": productNameController.text,
      "productQuantity": productQuantityController.text,
    };

    // Print updated order data
    print("Updated Order: $updatedOrder");

    // Navigate back or show a success message
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Order"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _updateOrder,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("Order Number", orderNumberController),
              const SizedBox(height: 16),
              _buildTextField("Customer Name", customerNameController),
              const SizedBox(height: 16),
              _buildTextField("Order Date", orderDateController),
              const SizedBox(height: 16),
              _buildTextField("Price", priceController),
              const SizedBox(height: 16),
              _buildTextField("Status", statusController),
              const SizedBox(height: 20),

              _buildSectionTitle("Shipping Details"),
              _buildTextField("Shipping Address", shippingAddressController),
              const SizedBox(height: 16),
              _buildTextField("Shipping Method", shippingMethodController),
              const SizedBox(height: 16),
              _buildTextField("Tracking Number", trackingNumberController),
              const SizedBox(height: 20),

              _buildSectionTitle("Product Details"),
              _buildTextField("Product Name", productNameController),
              const SizedBox(height: 16),
              _buildTextField("Quantity", productQuantityController),
              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: _updateOrder,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: const Text("Update Order"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
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
}
