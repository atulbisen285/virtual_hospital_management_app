import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:virtual_hospital_application/consts/strings.dart';

import '../consts/colors.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text(
            AppStrings.category, style: const TextStyle(fontSize: 18),),
        ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),

          child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 180,
              ),
              itemCount: iconList.length,
              itemBuilder: ( BuildContext context, int index){
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.blueColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            iconList[index],
                            width: 70,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        20.heightBox,
                         Text(
                          iconsTitleList[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16
                          ),
                        ),
                        10.heightBox,
                        const Text(
                         "13 specialists",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              },
          ),
        ),
    );
  }
}