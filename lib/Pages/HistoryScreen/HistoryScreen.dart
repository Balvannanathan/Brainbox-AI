import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/HistoryScreen/HistoryScreenVM.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppbar/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryScreen extends StatefulWidget {
  final Function onBackPress;
  const HistoryScreen({super.key, required this.onBackPress});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController searchController = TextEditingController();

  final HistoryScreenVM historyScreenVM = HistoryScreenVM();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HistoryScreenVM>(
      create: (context) => HistoryScreenVM(),
      child: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.primaryWhite,
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      CustomAppbar(
                        onBackPress: widget.onBackPress,
                        onMenuPress: () {},
                        titleString: 'History',
                      ),

                      SizedBox(height: 21.h),

                      Consumer<HistoryScreenVM>(
                        builder: (context, vm, child) => _searchField(vm),
                      ),

                      SizedBox(height: 21.h),

                      Consumer<HistoryScreenVM>(
                        builder: (context, vm, child) => _historyList(vm),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<HistoryScreenVM>(
              builder: (context, vm, child) => Visibility(
                visible: vm.isLoading,
                child: Scaffold(
                  backgroundColor: AppColors.primaryBlack.withOpacity(0.5),
                  body: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlack,
                      strokeWidth: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchField(HistoryScreenVM vm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: SizedBox(
        height: 50.h,
        child: TextField(
          style: Styles.buttonText.copyWith(color: AppColors.secondaryBlack),
          controller: searchController,
          keyboardType: TextInputType.text,
          cursorHeight: 15.h,
          cursorColor: AppColors.secondaryBlack,
          onChanged: (value) => vm.searchChat(value),
          decoration: InputDecoration(
            hint: Text(
              'Search...',
              style: Styles.buttonText.copyWith(color: AppColors.darkGrey),
            ),
            contentPadding: EdgeInsets.zero,

            prefixIcon: Icon(
              Icons.search,
              color: AppColors.secondaryBlack,
              size: 25.sp,
            ),
            suffixIcon: Visibility(
              visible: searchController.text.isNotEmpty,
              child: GestureDetector(
                onTap: () {
                  searchController.clear();

                  vm.searchChat('');
                },
                child: Icon(
                  Icons.close_sharp,
                  color: AppColors.secondaryBlack,
                  size: 25.sp,
                ),
              ),
            ),

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.84.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.84.r),
              borderSide: BorderSide.none,
            ),

            filled: true,
            fillColor: AppColors.textFieldFilledColor,
          ),
        ),
      ),
    );
  }

  Widget _historyList(HistoryScreenVM vm) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: ListView.separated(
        itemCount: vm.groupedChats.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0)
                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      vm.groupedChats.keys.elementAt(index),

                      style: Styles.textField.copyWith(
                        color: AppColors.secondaryBlack,
                      ),
                    ),
                  ),
                ),
              ...List.generate(
                vm.groupedChats.values.elementAt(index).length,
                (chatIndex) => Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: GestureDetector(
                    onTap: () {
                      vm.navigateToChatScreen(
                        vm.groupedChats.values
                            .elementAt(index)
                            .elementAt(chatIndex)
                            .chatId,
                      );
                    },
                    child: Container(
                      width: 344.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.textFieldFilledColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 13.h,
                          vertical: 12.h,
                        ),
                        child: Text(
                          vm.groupedChats.values
                              .elementAt(index)
                              .elementAt(chatIndex)
                              .chatName,
                          textAlign: TextAlign.start,
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.buttonText.copyWith(
                            color: AppColors.textFieldHint,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, seperatorIndex) {
          return Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Text(
              vm.groupedChats.keys.elementAt(seperatorIndex + 1),

              style: Styles.textField.copyWith(color: AppColors.secondaryBlack),
            ),
          );
        },
      ),
    );
  }
}
