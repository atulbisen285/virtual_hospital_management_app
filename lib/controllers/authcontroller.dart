import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';
import '../views/home_view/home.dart'; // Ensure you import GetX

class AuthController extends GetxController {
  // Corrected the spelling of TextEditingController
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UserCredential? userCredential;

   isUserAlreadyloggedIn() async {
     await FirebaseAuth.instance.authStateChanges().listen((User? user) {
     if (User != null) {
       Get.offAll(() => const Home());
     } else {
       Get.offAll(() => const LoginView());
      }
     });
   }
  // Method to sign up a user
  loginUser() async {
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential != null) {
        // Navigate to home screen or other appropriate action
      }
    } catch (e) {
      // Handle errors here (e.g., show a dialog or print error)
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  signupUser() async {
    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential != null) {
        await storeUserData(
          userCredential!.user!.uid,
          fullnameController.text,
          emailController.text,
        );
      }
    } catch (e) {
      // Handle errors here (e.g., show a dialog or print error)
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Method to store user data in Firestore
  storeUserData(String uid, String fullname, String email) async {
    var store = FirebaseFirestore.instance.collection('users').doc(uid);
    await store.set({
      'fullname': fullname,
      'email': email,
    });
  }
   signout() async{
     await FirebaseAuth.instance.signOut();
  }
}
