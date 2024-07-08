import 'package:flutter/material.dart';
import 'package:virtual_hospital_application/consts/consts.dart';
import '../../consts/strings.dart';

class CustomButton extends StatelessWidget{
  final Function()? onTap;
  final String buttonText;
  const CustomButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 44,
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
          ),
          onPressed: onTap,
          child: AppStrings.login.text.make()
      ),
    );
  }

}