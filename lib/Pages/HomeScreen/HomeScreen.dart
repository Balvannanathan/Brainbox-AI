import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/HomeScreen/HomeScreenVM.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppBar/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeScreenVM>(
      create: (context) => HomeScreenVM(),
      child: Consumer<HomeScreenVM>(
        builder: (context, vm, child) {
          return Scaffold(
            backgroundColor: AppColors.primaryWhite,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),

                  CustomAppbar(
                    onBackPress: vm.navigateBack,
                    onMenuPress: () {},
                    titleString: "",
                  ),

                  SizedBox(height: 107.h),

                  Image.asset(
                    'lib/Helpers/Resources/Images/Logo.png',
                    width: 154.w,
                    height: 184.5.h,
                  ),

                  SizedBox(height: 21.h),

                  Text(
                    ' Welcome to BrainBox',
                    textAlign: TextAlign.center,
                    style: Styles.appTitle.copyWith(
                      color: AppColors.primaryBlack,
                    ),
                  ),

                  SizedBox(height: 11.h),

                  Text(
                    'Start chatting with ChattyAI now.You can ask me anything.',
                    textAlign: TextAlign.center,
                    style: Styles.recommendationText.copyWith(
                      color: AppColors.darkGrey,
                    ),
                  ),

                  SizedBox(height: 102.h),

                  GestureDetector(
                    onTap: () {
                      vm.navigateToChatScreen();
                    },
                    child: Container(
                      width: 327.w,
                      height: 63.h,
                      decoration: BoxDecoration(
                        color: AppColors.secondaryBlack,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Center(
                        child: Text('Get Started', style: Styles.buttonText),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
