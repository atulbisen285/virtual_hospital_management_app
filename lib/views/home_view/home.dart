import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/bottombar_view/category_view.dart';
import 'package:virtual_hospital_application/bottombar_view/settings_view.dart';
import 'package:virtual_hospital_application/consts/colors.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';
import 'home_view.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;
  List screenList = [
      const HomeView(),
      const Category(),
      const LoginView(),
      const Settings(),
      Container(
        color: Colors.red,
      ),
      Container(
      color: Colors.green,
      ),
      Container(
      color: Colors.blue,
      ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: screenList.elementAt(selectedIndex),
       bottomNavigationBar: BottomNavigationBar(
         unselectedItemColor: Colors.white.withOpacity(0.5),
         selectedLabelStyle: TextStyle(
           color: AppColors.whiteColor,
         ),
         selectedIconTheme: IconThemeData(
           color: AppColors.whiteColor,
         ),
         backgroundColor: AppColors.blueColor,
         type: BottomNavigationBarType.fixed,
         currentIndex: selectedIndex,
         onTap: (value){
           setState(() {
             selectedIndex = value;
           });
         },
         items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
         BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
         BottomNavigationBarItem(icon: Icon(Icons.person),label: "Doctor"),
         BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),

       ],),
    );
  }
}
