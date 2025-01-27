import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/colors.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import 'package:virtual_hospital_application/consts/lists.dart';
import 'package:virtual_hospital_application/controllers/authcontroller.dart';
import 'package:virtual_hospital_application/controllers/settings_controller.dart';
import 'package:virtual_hospital_application/views/login_view/login_view.dart';
import 'package:get/get.dart';

import '../consts/images.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingsController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Settings"),
        backgroundColor: Colors.purple.shade700,
      ),
      body: Obx(()=>
        controller.isLoading.value ? const Center(child: CircularProgressIndicator(),
       )
      :Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Image.asset(AppAssets.imgSignup)),
                    title: Text(controller.username.value), // Replace with actual data
                    subtitle: Text(controller.email.value),
                  ),
                  const Divider(),
                  10.heightBox,
                  ListView(
                      shrinkWrap: true,
                      children: List.generate(
                        settingsList.length,
                            (index) => ListTile(
                          onTap: () async {
                            if (index == 2) {
                              await AuthController().signout();
                              Get.offAll(() => const LoginView());
                            }
                          },
                          leading: Icon(
                            settingsListIcon[index],
                            color: AppColors.blueColor,
                          ),
                          title: Text(settingsList[index]),
                        ),
                      ),
                    ),
                ],
        ),
      ),
    );
  }
}
