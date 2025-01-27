import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:virtual_hospital_application/appointment_view/appointment_detailsView.dart';
import 'package:virtual_hospital_application/consts/images.dart';
import '../consts/colors.dart';
import '../controllers/appointmentcontroller.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  int _buttonIndex = 0;
  final controller = Get.put(AppointmentController());

  final List<Widget> _scheduleWidgets = [
    // Upcoming Appointments
    const UpcomingScheduleView(),
    // Completed Appointments
    const Center(child: Text('No completed appointments')),
    // Canceled Appointments
    const Center(child: Text('No canceled appointments')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text("Appointments",style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Schedule",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(height: 20),
              _buildTabBar(),
              const SizedBox(height: 30),
              _scheduleWidgets[_buttonIndex],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTabButton("Upcoming", 0),
            _buildTabButton("Completed", 1),
            _buildTabButton("Canceled", 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _buttonIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        decoration: BoxDecoration(
          color: _buttonIndex == index ? const Color(0xFF7165D6) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: _buttonIndex == index ? Colors.white : Colors.black38,
          ),
        ),
      ),
    );
  }
}

// Upcoming Appointments View
class UpcomingScheduleView extends StatelessWidget {
  const UpcomingScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppointmentController>();

    return FutureBuilder<QuerySnapshot>(
      future: controller.getAppointments(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        } else {
          var data = snapshot.data?.docs ?? [];
          if (data.isEmpty) {
            return const Center(child: Text("No upcoming appointments"));
          }
          return Padding(
            padding: const EdgeInsets.all(0),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                var doc = data[index];
                return ListTile(
                  onTap: () {
                    Get.to(() => AppointmentDetail(doc: doc));
                  },
                  leading: CircleAvatar(
                    child: Image.asset(AppAssets.imgSignup),
                  ),
                  title: Text(doc['appWithName']),
                  subtitle: Text(
                    "${doc['appDay']} - ${doc['appTime']}",
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
