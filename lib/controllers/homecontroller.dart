import 'package:flutter/cupertino.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Homecontroller extends GetxController {
  var isLoading = false.obs;
  var searchQueryController = TextEditingController();
  get username => null;

  Future<QuerySnapshot<Map<String, dynamic>>> getDoctorlist() async {
    var doctors = await FirebaseFirestore.instance.collection('doctors').get();
    return doctors;
  }
}