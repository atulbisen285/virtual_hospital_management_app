import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; // Ensure you're importing the correct Material package
import 'package:get/get.dart';
import 'package:virtual_hospital_application/consts/consts.dart'; // Adjust the import as necessary

class AppointmentController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Loading state
  var isLoading = false.obs;

  // Form controllers
  var appDayController = TextEditingController();
  var appTimeController = TextEditingController();
  var appMobileController = TextEditingController();
  var appNameController = TextEditingController();
  var appMessageController = TextEditingController();

  /// Method to book an appointment
  Future<void> bookAppointment({
    required String docID,
    required String docName,
    required BuildContext context,
    required DateTime selectedDate,
    required TimeOfDay selectedTime,
    required String mobileNumber,
    required String fullName,
    required String message,
  }) async {
    try {
      isLoading(true); // Show loading indicator

      var store = _firestore.collection('appointments').doc();
      await store.set({
        'appBy': FirebaseAuth.instance.currentUser?.uid,
        'appDay': "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
        'appTime': "${selectedTime.hour}:${selectedTime.minute}",
        'appMobile': mobileNumber,
        'appName': fullName,
        'appMsg': message,
        'appWith': docID,
        'appWithName': docName,
        'timestamp': FieldValue.serverTimestamp(), // Add timestamp for ordering
      });

      Get.snackbar('Success', 'Appointment booked successfully!', snackPosition: SnackPosition.BOTTOM);
      Get.back(); // Navigate back
    } catch (e) {
      Get.snackbar('Error', 'Failed to book appointment: $e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false); // Hide loading indicator
    }
  }

  /// Method to fetch appointments
  Future<QuerySnapshot<Map<String, dynamic>>> getAppointments() async {
    return await _firestore.collection('appointments').get();
  }

  /// Method to fetch doctors
  Future<QuerySnapshot<Map<String, dynamic>>> getDoctors() async {
    return await _firestore.collection('doctors').get();
  }

  /// Optional: Dispose form controllers to prevent memory leaks
  @override
  void onClose() {
    appDayController.dispose();
    appTimeController.dispose();
    appMobileController.dispose();
    appNameController.dispose();
    appMessageController.dispose();
    super.onClose();
  }
}
