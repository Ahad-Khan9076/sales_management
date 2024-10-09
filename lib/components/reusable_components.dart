import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final TextEditingController? controller;

  CustomTextField({
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey[400]), // Light grey color
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey[400]!),
            ),
          ),
        ),
      ],
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  final TextEditingController? controller;

  PhoneNumberField({this.controller});

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint text color
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
      ),
      initialCountryCode: 'US',
      onChanged: (phone) {
        print(phone.completeNumber); // Complete phone number including country code
      },
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  SocialMediaButton({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.teal),
      label: Text(text, style: TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  SignUpButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150, // Reduced width for sign-up button
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
