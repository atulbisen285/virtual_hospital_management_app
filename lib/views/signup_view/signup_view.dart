import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import '../../consts/images.dart';
import '../../consts/strings.dart';
import '../login_view/login_view.dart';



class SignupView extends StatefulWidget{
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
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
                    AppAssets.imgSignup,
                    width: 200,
                  ),
                  //3.heightBox,
                  Text(
                      AppStrings.signupNow,style: const TextStyle(fontWeight: FontWeight.w500,fontSize: 21
                  )),
                  Text(
                      AppStrings.signupNow1,style: const TextStyle(fontWeight: FontWeight.w400,fontSize: 19
                  )),
                ],
              ),
              20.heightBox,
               TextFormField(
                decoration: InputDecoration(
                  hintText: "Full Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                    borderSide: const BorderSide(
                      color: Color(0xff281538),
                      width: 11,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.supervised_user_circle_sharp,
                    size: 21,
                    color: Color(0xff281537),
                  ),
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
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
                height: 17,
              ),
              TextFormField(
                obscureText: !_isPasswordVisible,
                obscuringCharacter: '*',
                decoration: InputDecoration(
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
                  onPressed: () {},
                  child: const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account?",
                    style: TextStyle(
                        fontSize: 17,
                       // color: Color(0xff281537),
                        fontWeight: FontWeight.w300),
                  ),
                  8.widthBox,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginView());
                    },
                    child: const Text(
                      "Log in?",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
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