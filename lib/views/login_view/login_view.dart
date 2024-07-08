import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../home_view/home.dart';
import '../signup_view/signup_view.dart';


class LoginView extends StatefulWidget{
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late  bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppAssets.imgLogin,
                    width: 200,
                  ),
                  10.heightBox,
                  Text(
                      AppStrings.welcomeback,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 21
                  )),
                  Text(
                      AppStrings.weAreExcited,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 14
                  )),

                ],
              ),
              30.heightBox,
              TextFormField(
               controller: email,
                decoration: InputDecoration(
                  label: const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff281538)),
                  ),
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xff281538),
                      width: 11,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 21,
                    color: Color(0xff281537),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              TextFormField(
                controller: password,
                obscureText: !_isPasswordVisible,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  label: const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff281538)),
                  ),
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 21,
                    color: Color(0xff281537),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                    onPressed: togglePasswordVisibility,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                width: context.screenWidth,
                height: 44,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    Get.to(()=> const Home());
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              14.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff281537),
                        fontWeight: FontWeight.w400),
                  ),
                   12.widthBox,
                   GestureDetector(
                     onTap: () {
                       Get.to(() => const SignupView());
                     },
                    child: const Text(
                      "SignUp?",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement Google sign-in functionality
                    },
                    icon: Image.asset(
                      AppAssets.imgGoogle,
                      height: 24,
                      width: 24,
                    ),
                    label: const Text('Google'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                  10.widthBox,
                  const Text("Or"),
                  10.widthBox,
                  ElevatedButton.icon(
                    onPressed: () {
                      // Implement Facebook sign-in functionality
                    },
                    icon: Image.asset(
                      AppAssets.imgFacebook,
                      height: 24,
                      width: 24,
                    ),
                    label: const Text('Facebook'),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                    ),
                  ),
                ],
              ),
          ],
        ),
       ),
      ),
    );
  }
}