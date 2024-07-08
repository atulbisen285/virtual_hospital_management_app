import 'package:flutter/material.dart';
import '../../consts/colors.dart';
class CustomTextField extends StatefulWidget{
  final String hint;
  final TextEditingController? textController;
  final Color textColor;
  final Color borderColor;
  const CustomTextField({super.key, required this.hint, this.textController, this.textColor = Colors.black, this.borderColor = Colors.black,});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
     return TextFormField(
       cursorColor: AppColors.blueColor,
       decoration: InputDecoration(
         isDense: true,
         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(
             color: widget.borderColor,
           )
         ),
         enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
             color: widget.borderColor,
            )
         ),
           border: OutlineInputBorder(
             borderSide: BorderSide(
               color: widget.borderColor,
             )
           ),
           hintText: widget.hint,
           hintStyle: TextStyle(
             color: widget.textColor,
           )
       ),
     );
  }
}