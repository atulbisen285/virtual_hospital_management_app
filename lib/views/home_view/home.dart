import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/bottombar_view/category_view.dart';
import 'package:virtual_hospital_application/bottombar_view/settings_view.dart';
import 'package:virtual_hospital_application/consts/colors.dart';
import 'package:virtual_hospital_application/doctor_view/appointment_view.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';
import 'home_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final List<Widget> screenList = [
    const HomeView(),
    const Appointments(),
    const Category(),
    const Settings(),
    Container(color: Colors.red),
    Container(color: Colors.green),
    Container(color: Colors.blue),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screenList[selectedIndex],
      bottomNavigationBar: Container(
        height: 80, // Set height to match your desired design
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
          ),
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: "Appointments",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
