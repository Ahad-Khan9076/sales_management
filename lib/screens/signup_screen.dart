import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../components/reusable_components.dart';
import 'login_screen.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Welcome to the App",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  "Enter your credentials",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Signup to your account",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButton(
                          icon: FontAwesomeIcons.google,
                          text: 'Google',
                          onPressed: () {},
                        ),
                        const SizedBox(width: 20),
                        SocialMediaButton(
                          icon: FontAwesomeIcons.github,
                          text: 'GitHub',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Expanded(child: Divider(thickness: 2, color: Colors.black45)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("OR", style: TextStyle(color: Colors.black54, fontSize: 16)),
                        ),
                        Expanded(child: Divider(thickness: 2, color: Colors.black45)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(child: CustomTextField(label: "First Name", hintText: "BitStorm")),
                        const SizedBox(width: 10),
                        Expanded(child: CustomTextField(label: "Last Name", hintText: "Solutions")),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(label: "Email", hintText: "bitstormSolution@gmail.com"),
                    const SizedBox(height: 20),
                    CustomTextField(label: "Password", hintText: "Password", obscureText: true),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[400]!), // Border color for the combined phone field
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          CountryCodePicker(
                            onChanged: (country) {},
                            initialSelection: 'US',
                            favorite: ['+1', 'US'],
                            showCountryOnly: false,
                            showFlag: true,
                            alignLeft: false,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(color: Colors.grey[400]), // Light grey hint text color
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(vertical: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 200, // Adjusted button width to be narrower
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text("Signup", style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Get.to(LoginScreen());
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
