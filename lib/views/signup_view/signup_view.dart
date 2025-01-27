import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/images.dart';
import 'package:virtual_hospital_application/controllers/authcontroller.dart';
import 'package:get/get.dart';
import '../home_view/home.dart';
import '../login_view/login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  late bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image section
                Image.asset(
                  AppAssets.imgUserLogin,// Replace with correct asset path
                  width: 300,
                ),
                const SizedBox(height: 30),

                // Title and subtitle section
                const Text(
                  'Register User',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create your account!',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins'),
                ),
                const SizedBox(height: 20),

                // Full Name TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.fullnameController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Full Name',
                        hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins')),
                  ),
                ),
                const SizedBox(height: 10),

                // Email TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.emailController,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'Poppins')),
                  ),
                ),
                const SizedBox(height: 10),

                // Password TextField
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextField(
                    controller: controller.passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Enter Password',
                      hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Poppins'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: togglePasswordVisibility,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                GestureDetector(
                  onTap: () async {
                    await controller.signupUser();
                    if (controller.userCredential != null) {
                      Get.offAll(() => Home()); // Replace with your Home widget
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7165D6),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Already have an account? Login link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginView());
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color(0xFF7165D6),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
