import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Function onBackPress;
  final String? titleString;
  final Function onMenuPress;
  const CustomAppbar({
    super.key,
    required this.onBackPress,
    this.titleString,
    required this.onMenuPress,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => onBackPress(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.primaryWhite,
              boxShadow: [
                BoxShadow(
                  offset: Offset(5.92, 11.84),
                  blurRadius: 23.68,
                  color: AppColors.blurWhite.withOpacity(0.3),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 16.h),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.primaryBlack,
                size: 18.sp,
              ),
            ),
          ),
        ),

        Visibility(
          visible: titleString != null && titleString!.isNotEmpty,
          child: Text(titleString ?? '', style: Styles.appBarTitle),
        ),

        GestureDetector(
          onTap: () => onMenuPress(),
          child: SizedBox(
            width: 45.w,
            height: 45.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.h),
              child: Image.asset(
                'lib/Helpers/Resources/Images/MenuIcon.png',
                // width: 20.w,
                // height: 3.92.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
