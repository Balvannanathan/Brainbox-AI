import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.textField,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.84),
          borderSide: BorderSide(color: AppColors.primaryWhite, width: 2.w),
        ),

        hint: Text(''),

        enabledBorder: InputBorder.none,

        errorBorder: InputBorder.none,

        disabledBorder: InputBorder.none,
      ),
    );
  }
}
