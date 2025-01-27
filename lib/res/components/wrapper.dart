/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/views/home_view/home_view.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if (snapshot.hasData){
              return const HomeView();
            }else{
              return const LoginView();
            }
          }),
    );
  }

}*/