import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';

import '../consts/colors.dart';
import '../consts/images.dart';

class Category extends StatelessWidget{
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text(
        "Category Name", style: TextStyle(color: Colors.white, fontSize: 18,)),
     ),
      body: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 8,crossAxisSpacing: 8,mainAxisSpacing: 170,
      ),
          itemCount: 10,
          itemBuilder:(BuildContext context, int index){
            return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                color: AppColors.bgDarkColor,
                borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(right: 8),
            height: 100,
            width: 150,
             child: Column(
               children: [
                 Container(
                    width: 150,
                    alignment: Alignment.center,
                    color: AppColors.blueColor,
                    child: Image.asset(AppAssets.imgSignup,
                     width: 100,
                     height: 100,
                     fit: BoxFit.cover,
                   ),
                 ),
                 5.heightBox,
                 const Text("DoctorName"),
                 5.heightBox,
                 const Text("Category",style: TextStyle(color: Colors.black54),),
               ],
             ),
            );
          }
       ),
    );
  }

}