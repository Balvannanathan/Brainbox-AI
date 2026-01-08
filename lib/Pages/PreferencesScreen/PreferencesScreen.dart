import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/PreferencesScreen/PreferencesScreenVM.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppbar/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  List<Map<String, String>> services = [
    {"Account Information": "Change your Account information"},
    {"Password": "Change your Password"},
    {"Payment Methods": "Add Your Credit / Credit Cards"},
    {"Invite Your Friends": "Get \$3 For Each Invitation!"},
    {"Theme Colour": "Change Your Theme Colour"},
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PreferencesScreenVM>(
      create: (context) => PreferencesScreenVM(),
      child: Consumer<PreferencesScreenVM>(
        builder: (context, vm, child) => Scaffold(
          backgroundColor: AppColors.primaryWhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 50.h),

                CustomAppbar(
                  onBackPress: () => vm.navigateBack(),
                  onMenuPress: () {},
                  titleString: 'Preference',
                ),

                SizedBox(height: 44.h),

                _listOfServices(vm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listOfServices(PreferencesScreenVM vm) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => vm.navigateToEditProfile(),
            child: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 40.h),
              child: ListTile(
                leading: Image.asset(
                  'lib/Helpers/Resources/Images/pre${index + 1}.png',
                  width: 24.31.w,
                  height: 25.h,
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  services[index].keys.first,
                  style: Styles.preferenceText,
                ),
                subtitle: Text(
                  services[index].values.first,
                  style: Styles.preferenceSubText,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
