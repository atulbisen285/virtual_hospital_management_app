import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/res/components/wrapper.dart';
import 'package:virtual_hospital_application/views/login_view/doctor_login.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                'assets/images/splashimage.jpg',
                color: Colors.purple.withOpacity(1.0),
                colorBlendMode: BlendMode.softLight,
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              'Medico',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: Color(0xFF7165D6),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Appoint your doctor with one tap',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Choose Your Role',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorLogin(),
                      ),
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: const Color(0xFF7165D6),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/docrole.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Doctor',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(
                        color: const Color(0xFF7165D6),
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/userrole.png',
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'User',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
