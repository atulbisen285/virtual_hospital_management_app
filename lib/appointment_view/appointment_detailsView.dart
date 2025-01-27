import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import '../consts/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class AppointmentDetail extends StatelessWidget{
  final DocumentSnapshot doc;
  const AppointmentDetail({super.key, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blueColor,
        title:Text( doc['appWithName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Select appointment day",style: TextStyle(fontWeight:FontWeight.bold),),
            5.heightBox,
             Text(doc['appDay']),
            10.heightBox,
            const Text("Select appointment time",style: TextStyle(fontWeight:FontWeight.bold),),
            5.heightBox,
            Text(doc['appTime']),
            20.heightBox,
            const Text("Mobile Number: ",style: TextStyle(fontWeight:FontWeight.bold),),
            5.heightBox,
            Text(doc['appMobile']),
            10.heightBox,
            const Text("Full Name: ",style: TextStyle(fontWeight:FontWeight.bold),),
            5.heightBox,
            Text(doc['appName']),
            10.heightBox,
            const Text("Message",style: TextStyle(fontWeight:FontWeight.bold),),
            5.heightBox,
            Text(doc['appMsg']),
          ],
        ),
      ),
    );
  }

}
