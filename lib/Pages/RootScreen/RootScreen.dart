import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/AiAssistantScreen/AiAssistantScreen.dart';
import 'package:brainbox_ai/Pages/HistoryScreen/HistoryScreen.dart';
import 'package:brainbox_ai/Pages/HomeScreen/HomeScreen.dart';
import 'package:brainbox_ai/Pages/ProfileScreen/ProfileScreen.dart';
import 'package:brainbox_ai/Pages/RootScreen/RootScreenVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rootscreen extends StatefulWidget {
  const Rootscreen({super.key});

  @override
  State<Rootscreen> createState() => _RootscreenState();
}

class _RootscreenState extends State<Rootscreen> {
  final List<BottomNavItem> bottomNavItems = [
    BottomNavItem(
      icon: 'lib/Helpers/Resources/Images/item1.png',
      activeIcon: 'lib/Helpers/Resources/Images/item1-s.png',
      showIndicator: true,
    ),
    BottomNavItem(
      icon: 'lib/Helpers/Resources/Images/item2.png',
      activeIcon: 'lib/Helpers/Resources/Images/item2-s.png',
      showIndicator: true,
    ),
    BottomNavItem(
      icon: 'lib/Helpers/Resources/Images/item3.png',
      activeIcon: 'lib/Helpers/Resources/Images/item3-s.png',
      showIndicator: true,
    ),
    BottomNavItem(
      icon: 'lib/Helpers/Resources/Images/item4.png',
      showIndicator: true,
      activeIcon: 'lib/Helpers/Resources/Images/item4-s.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RootScreenVM>(
      create: (context) => RootScreenVM(),
      child: Consumer<RootScreenVM>(
        builder: (context, vm, child) => Scaffold(
          backgroundColor: AppColors.primaryWhite,
          body: IndexedStack(
            index: vm.selectedIndex,
            children: [
              HomeScreen(),
              vm.isAiAssistantScreenCalled ? AiAssistantScreen() : SizedBox(),
              vm.isHistoryScreenCalled
                  ? HistoryScreen(onBackPress: vm.updatePreviousIndex)
                  : SizedBox(),
              vm.isProfileScreenCalled
                  ? ProfileScreen(onBackPress: vm.updatePreviousIndex)
                  : SizedBox(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 95.h,
            // padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.primaryWhite,
              border: Border(
                top: BorderSide(color: AppColors.bottomNavBorder, width: 1.2.w),
              ),
            ),
            child: Theme(
              data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: vm.selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                onTap: (index) {
                  vm.updateSelectedIndex(index);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: AppColors.primaryWhite,
                items: List.generate(bottomNavItems.length, (index) {
                  final item = bottomNavItems[index];

                  return BottomNavigationBarItem(
                    label: '',
                    icon: Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Image.asset(
                        item.icon,
                        width: index == 0 ? 30.w : 25.w,
                        height: index == 0 ? 30.h : 25.h,
                      ),
                    ),

                    activeIcon: item.showIndicator
                        ? Padding(
                            padding: EdgeInsets.only(top: 15.h),
                            child: Column(
                              children: [
                                Image.asset(
                                  item.activeIcon,
                                  width:
                                      index == 0 ||
                                          index == bottomNavItems.length - 1
                                      ? 30.w
                                      : 25.w,
                                  height:
                                      index == 0 ||
                                          index == bottomNavItems.length - 1
                                      ? 30.h
                                      : 25.h,
                                ),
                                const SizedBox(height: 5),
                                AnimatedScale(
                                  scale: item.showIndicator ? 1 : 0,
                                  duration: const Duration(milliseconds: 200),
                                  child: Container(
                                    width: 7.21.w,
                                    height: 7.21.h,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryBlack,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.asset(
                            item.activeIcon,
                            width: 25.w,
                            height: 25.h,
                          ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavItem {
  final String icon;
  final String activeIcon;
  final bool showIndicator;

  const BottomNavItem({
    required this.icon,
    required this.activeIcon,
    this.showIndicator = false,
  });
}
