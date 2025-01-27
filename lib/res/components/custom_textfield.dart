import 'package:flutter/material.dart';
import '../../consts/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final Color inputColor;
  final Color textColor;
  final Color borderColor;
  final bool readOnly; // Added readOnly property

  const CustomTextField({
    Key? key,
    required this.hint,
    this.textController,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.inputColor = Colors.black,
    this.readOnly = false,// Default value for readOnly
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      readOnly: widget.readOnly, // Use the readOnly property
      cursorColor: AppColors.blueColor,
      style: TextStyle(color: widget.inputColor),
      decoration: InputDecoration(
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.borderColor,
          ),
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: widget.textColor,
        ),
      ),
    );
  }
}
