import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_hospital_application/controllers/appointmentcontroller.dart';
import '../res/components/custom_textfield.dart';

class BookAppointmentScreen extends StatefulWidget {
  final String docID; // Add these parameters to the constructor
  final String docName;

  // Constructor to accept the doctor ID and name
  const BookAppointmentScreen({Key? key, required this.docID, required this.docName}) : super(key: key);

  @override
  _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final AppointmentController controller = Get.put(AppointmentController());

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text('Book Appointment'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text("Select appointment day"),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
                label: Text(
                  'Select Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.deepPurple.shade700,
                  minimumSize: Size(150, 40),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Selected Date: ${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              const Text("Select appointment time"),
              SizedBox(height: 5),
              ElevatedButton.icon(
                onPressed: () => _selectTime(context),
                icon: Icon(Icons.access_time),
                label: Text(
                  'Select Time',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  backgroundColor: Colors.deepPurple.shade700,
                  minimumSize: Size(140, 45),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Selected Time: ${selectedTime.hour}:${selectedTime.minute}',
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              const Text("Mobile Number: "),
              SizedBox(height: 5),
              CustomTextField(
                hint: "Enter your mobile number",
                textController: controller.appMobileController,
              ),
              SizedBox(height: 10),
              const Text("Full Name: "),
              SizedBox(height: 5),
              CustomTextField(
                hint: "Enter your Name",
                textController: controller.appNameController,
              ),
              SizedBox(height: 10),
              const Text("Message"),
              SizedBox(height: 5),
              CustomTextField(
                hint: "Enter your Message",
                textController: controller.appMessageController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: controller.isLoading.value
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
          ),
          onPressed: () async {
            // Ensure to pass the doctor's ID and name from the widget's parameters
            await controller.bookAppointment(
              docID: widget.docID, // The doctor's ID
              docName: widget.docName, // The doctor's name
              context: context,
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              mobileNumber: controller.appMobileController.text,
              fullName: controller.appNameController.text,
              message: controller.appMessageController.text,
            );
          },
          child: const Text("Book an Appointment"),
        ),
      )),
    );
  }
}
