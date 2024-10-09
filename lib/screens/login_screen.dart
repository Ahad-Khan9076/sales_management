import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sales_management/screens/admin_dashboard.dart';
import '../components/reusable_components.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Welcome Back",
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
                  "Login to continue",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Login to your account",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(label: "Email", hintText: "example@email.com"),
                    const SizedBox(height: 20),
                    CustomTextField(label: "Password", hintText: "Password", obscureText: true),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(const AdminDashboard());
                        const GetSnackBar(
                          title:'Login Sucessfuly',
                          snackPosition:SnackPosition.TOP,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: const Text("Login", style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                    const SizedBox(height: 10,),
                    const Text('OR'),
                    const SizedBox(height: 20,),
                    SocialMediaButton(icon: FontAwesomeIcons.google, text:'Login with Google', onPressed: (){}),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                    const GetSnackBar(
                    snackPosition: SnackPosition.TOP,
                      title: 'Signup',
                    titleText: Text('Get ready to get Signup in the account'),
                  );
                },
                child: const Center(
                  child: Text('Already have an account? SignUP!',style: TextStyle(color:Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
