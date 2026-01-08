import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/ProfileScreen/ProfileScreenVM.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppbar/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  final Function onBackPress;
  const ProfileScreen({super.key, required this.onBackPress});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> services = ['Preferences', 'Customer Support', 'Logout'];
  List<String> icons = ['Prefe', 'Business', 'Enterprise'];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileScreenVM>(
      create: (context) => ProfileScreenVM(),
      child: Consumer<ProfileScreenVM>(
        builder: (context, vm, child) => Scaffold(
          backgroundColor: AppColors.primaryWhite,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SizedBox(height: 50.h),

                CustomAppbar(
                  onBackPress: () => widget.onBackPress(),
                  onMenuPress: () {},
                  titleString: 'Profile',
                ),

                SizedBox(height: 44.h),

                _profileImage(),

                SizedBox(height: 12.h),

                _profileName(),

                SizedBox(height: 64.06.h),

                _listOfServices(vm),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomRight,
      children: [
        Image.asset(
          'lib/Helpers/Resources/Images/profile.png',
          width: 105.w,
          height: 112.h,
        ),

        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            width: 25.w,
            height: 25.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryBlack,
              border: Border.all(color: AppColors.primaryWhite, width: 4.w),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileName() {
    return Column(
      children: [
        Text('Tom Hillson', style: Styles.profileName),

        Text(
          'Tomhill@mail.com',
          style: Styles.buttonText.copyWith(
            color: AppColors.primaryBlack.withOpacity(0.52),
          ),
        ),
      ],
    );
  }

  Widget _listOfServices(ProfileScreenVM vm) {
    return Column(
      children: [
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              switch (index) {
                case 0:
                  vm.navigateToPreferences();
                  break;
                case 1:
                  vm.navigateToCustomerSupport();
                  break;
              }
            },
            child: Padding(
              padding: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 20.h),
              child: ListTile(
                leading: Image.asset(
                  'lib/Helpers/Resources/Images/profile${index + 1}.png',
                  width: 32.66.w,
                  height: 32.66.h,
                ),
                contentPadding: EdgeInsets.zero,
                title: Text(services[index], style: Styles.profileServiceText),
                trailing: Visibility(
                  visible: index != 2,
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 16.sp),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
