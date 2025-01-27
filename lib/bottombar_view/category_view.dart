import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you have GetX imported for navigation
import 'package:virtual_hospital_application/category_detail/category_detail.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:virtual_hospital_application/consts/strings.dart';
import '../consts/colors.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700, // Use your defined color
        elevation: 0,
        title: Text(
          AppStrings.category,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Updated text style
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12, // Increased spacing for a better layout
            crossAxisSpacing: 12,
            mainAxisExtent: 200, // Increased height for better appearance
          ),
          itemCount: iconList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => Categorys(catName: iconsTitleList[index]));
              },
              child: Container(
                padding: const EdgeInsets.all(8), // Increased padding for better touch targets
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Added border radius for rounded corners
                  color: AppColors.bgDarkColor, // Updated background color
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center, // Centering elements
                  children: [
                    Image.asset(
                      iconList[index],
                      width: 70,
                      height: 70, // Set a height for better alignment
                    ),
                    const SizedBox(height: 10), // Space between the image and text
                    Text(
                      iconsTitleList[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600, // Updated font weight for visibility
                      ),
                      textAlign: TextAlign.center, // Centered text
                    ),
                    const SizedBox(height: 5), // Space between the title and specialist text
                    const Text(
                      "13 specialists",
                      style: TextStyle(
                        color: Colors.grey, // Updated text color for readability
                        fontSize: 14,
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
