import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:virtual_hospital_application/consts/images.dart';
import 'package:virtual_hospital_application/res/components/custom_textfield.dart';
import '../../consts/colors.dart';
import '../../consts/strings.dart';
class HomeView extends StatefulWidget{
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: const Text("Welcome User"),
      ),
      body: Column(
        children: [
          Container(
            padding:  const EdgeInsets.all(14),
            color: AppColors.blueColor,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hint: AppStrings.search,
                    borderColor: AppColors.whiteColor,
                    textColor: AppColors.whiteColor,
                  ),
                ),
                10.widthBox,
                IconButton(onPressed: () {} ,
                    icon: Icon(
                      Icons.search,
                    color: AppColors.whiteColor,
                    ))
              ],
            ),
          ),
          20.heightBox,
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 9,
                    itemBuilder:(BuildContext context, int index){
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.blueColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                         padding: const EdgeInsets.all(12),
                         margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            children: [
                              Image.asset(
                                 iconList[index],
                                  width: 30,
                                  //color: AppColors.whiteColor,
                              ),
                              5.heightBox,
                              Text(
                                iconsTitleList[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),

                            ],
                          ),
                        ),
                      );
                      },
                  ),
                ),
                20.heightBox,
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Popular Doctors", style: TextStyle(color: Colors.blue,fontSize:18)),),
                10.heightBox,
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
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
                ),
                5.heightBox,
                GestureDetector(
                  onTap: () {},
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text("View All", style: TextStyle(color: Colors.blue),),
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) => Container(
                    decoration: BoxDecoration(
                      color: AppColors.blueColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Image.asset(AppAssets.icBody,width: 25,),
                        5.heightBox,
                        const Text("Lab Test",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  )),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}