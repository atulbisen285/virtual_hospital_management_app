import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/colors.dart';
import '../../consts/images.dart';
import '../../doctor_view/doctor_profile_view.dart';

class SearchView extends StatelessWidget {
  final String searchQuery;

  const SearchView({Key? key, required this.searchQuery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: const Text("Search Results"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('doctors').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          // Display loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Handle errors
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error occurred. Please try again."),
            );
          }

          // No data available case
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("No doctors found."),
            );
          }

          // Filter the results based on the search query
          var filteredDocs = snapshot.data!.docs.where((doc) {
            String docName = doc['docName'].toString().toLowerCase();
            return docName.contains(searchQuery.toLowerCase());
          }).toList();

          // If no matching results
          if (filteredDocs.isEmpty) {
            return const Center(
              child: Text("No matching results found."),
            );
          }

          // Display search results in a grid
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 170,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: filteredDocs.length,
              itemBuilder: (BuildContext context, int index) {
                var doc = filteredDocs[index];

                return GestureDetector(
                  onTap: () {
                    Get.to(() => DoctorProfileView(doc: doc));
                  },
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: AppColors.bgDarkColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(right: 8),
                    height: 100,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Container
                        Container(
                          alignment: Alignment.center,
                          //color: AppColors.blueColor,
                          child: Image.asset(
                            AppAssets.imgSignup,
                            width: 120,
                            height: 110,
                           // width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        5.heightBox,
                        // Doctor Name
                        Text(
                          doc['docName'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.heightBox,
                        // Rating Widget
                        VxRating(
                          onRatingUpdate: (value) {},
                          maxRating: 5,
                          count: 5,
                          value: double.parse(doc['docRating'].toString()),
                          stepInt: true,
                          size: 20,
                          selectionColor: AppColors.yellowColor,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
