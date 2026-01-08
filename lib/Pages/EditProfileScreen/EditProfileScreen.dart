import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppBar/CustomAppbar.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryWhite,
      body: Column(
        children: [
          SizedBox(height: 50.h),

          CustomAppbar(
            onBackPress: () {},
            onMenuPress: () {},
            titleString: 'Edit Information',
          ),

          SizedBox(height: 122.58.h),

          
        ],
      ),
    );
  }
}
