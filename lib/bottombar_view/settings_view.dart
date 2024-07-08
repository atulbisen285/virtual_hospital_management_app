 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/colors.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:virtual_hospital_application/consts/lists.dart';

import '../consts/images.dart';

class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
     return  Scaffold(
       appBar: AppBar(
         elevation: 0.0,
         title: const Text("Settings"),
         backgroundColor: AppColors.blueColor,
       ),
       body: Column(
         children: [
           ListTile(
             leading: CircleAvatar(child: Image.asset(AppAssets.imgSignup)),
             title: const Text("Username"),
             subtitle: const Text("user_email@gmai.com"),
           ),
           const Divider(),
           10.heightBox,
           ListView(
             shrinkWrap: true,
             children: List.generate(
                 settingsList.length, (index) => ListTile(
               onTap: () {},
               leading: Icon(
                   settingsListIcon[index],
                   color: AppColors.blueColor   ,
               ),
                 title: Text(settingsList[index],
                 ),
             ))
           ),
         ],
       ),
     );
  }

}