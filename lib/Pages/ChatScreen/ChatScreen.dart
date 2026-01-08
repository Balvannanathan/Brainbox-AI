import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:brainbox_ai/Helpers/Styles.dart';
import 'package:brainbox_ai/Pages/ChatScreen/ChatScreenVM.dart';
import 'package:brainbox_ai/Pages/ChatScreen/DependentViews/TypingIndicator.dart';
import 'package:brainbox_ai/Pages/ReusableViews/CustomAppbar/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  final int? extraData;
  const ChatScreen({super.key, this.extraData});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _messageController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _sendMessage(ChatScreenVM vm) {
    if (_messageController.text.trim().isEmpty) return;

    final message = _messageController.text.trim();
    _messageController.clear();

    // Call VM method to send message
    vm.sendMessage(message);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChatScreenVM>(
      create: (context) => ChatScreenVM(widget.extraData),
      builder: (context, child) => GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.primaryWhite,
          body: Consumer<ChatScreenVM>(
            builder: (context, vm, child) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    SizedBox(height: 50.h),

                    CustomAppbar(
                      onBackPress: () => vm.navigateBack(),
                      onMenuPress: () {},
                    ),

                    Expanded(
                      child: (vm.chatBO?.messages?.isNotEmpty ?? false)
                          ? _chatView(vm)
                          : _emptyChat(),
                    ),

                    _messageInput(vm),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _chatView(ChatScreenVM vm) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      itemCount: vm.chatBO?.messages?.length ?? 0,
      itemBuilder: (context, index) {
        final message = vm.chatBO?.messages?[index];
        return Column(
          children: [
            // User question bubble
            _userMessageBubble(message?.question ?? ''),
            SizedBox(height: 12.h),

            // Bot answer bubble
            _botMessageBubble(message?.answer ?? '', vm.isLoading),
            SizedBox(height: 20.h),
          ],
        );
      },
    );
  }

  Widget _userMessageBubble(String message) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: 280.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.secondaryBlack,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18.r),
            topRight: Radius.circular(18.r),
            bottomLeft: Radius.circular(18.r),
            bottomRight: Radius.circular(4.r),
          ),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 14.sp, height: 1.4),
        ),
      ),
    );
  }

  Widget _botMessageBubble(String message, bool isLoading) {
    return message.isEmpty && isLoading
        ?
          // Typing indicator
          _typingIndicator()
        : Align(
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Bot avatar
                Container(
                  width: 32.w,
                  height: 32.w,
                  decoration: BoxDecoration(
                    color: AppColors.lightGrey,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.smart_toy_outlined,
                      size: 18.sp,
                      color: AppColors.secondaryBlack,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),

                // Message bubble
                Flexible(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 280.w),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.r),
                        topRight: Radius.circular(18.r),
                        bottomLeft: Radius.circular(18.r),
                        bottomRight: Radius.circular(18.r),
                      ),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: AppColors.secondaryBlack,
                        fontSize: 14.sp,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _typingIndicator() {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.smart_toy_outlined,
                  size: 18.sp,
                  color: AppColors.secondaryBlack,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: AppColors.lightGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.r),
                  topRight: Radius.circular(18.r),
                  bottomLeft: Radius.circular(18.r),
                  bottomRight: Radius.circular(18.r),
                ),
              ),

              child: TypingIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyChat() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          SizedBox(height: 20.h),

          Text('BrainBox', style: Styles.appTitle),

          SizedBox(height: 56.h),

          _chatRecommendations(),

          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _messageInput(ChatScreenVM vm) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30.h),
      decoration: BoxDecoration(color: AppColors.primaryWhite),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              style: Styles.sendButtonText,
              cursorColor: AppColors.textGrey,
              controller: _messageController,
              cursorHeight: 15.h,
              maxLines: null,
              textInputAction: TextInputAction.send,
              onSubmitted: (_) => _sendMessage(vm),
              decoration: InputDecoration(
                hintText: 'Send a message',
                hintStyle: Styles.sendButtonHint,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                // constraints: BoxConstraints(maxHeight: 100.h),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: AppColors.sendButtonBorder,
                    width: 1.w,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(
                    color: AppColors.sendButtonBorder,
                    width: 1.5.w,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Send button
          GestureDetector(
            onTap: _messageController.text.trim().isEmpty
                ? null
                : () => _sendMessage(vm),
            child: Container(
              width: 47.w,
              height: 48.w,
              padding: EdgeInsets.only(left: 13.w, right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.h),
                color: _messageController.text.trim().isEmpty
                    ? AppColors.primaryWhite
                    : AppColors.secondaryBlack,
              ),
              child: Icon(
                Icons.send_rounded,
                color: _messageController.text.trim().isEmpty
                    ? AppColors.textGrey
                    : Colors.white,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chatRecommendations() {
    final recommendations = [
      'Remembers what user said earlier in the conversation',
      'Allows user to provide follow-up corrections',
      'Trained to decline inappropriate requests',
      'Can help with creative writing and brainstorming',
      'Provides detailed explanations on complex topics',
    ];

    return ListView.builder(
      itemCount: recommendations.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: InkWell(
            onTap: () {
              // Handle recommendation tap
              _messageController.text = recommendations[index];
            },
            borderRadius: BorderRadius.circular(14.49.r),
            child: Container(
              width: 344.w,
              height: 82.2.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.49.r),
                color: AppColors.lightGrey,
                border: Border.all(
                  color: AppColors.sendButtonBorder.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  recommendations[index],
                  textAlign: TextAlign.center,
                  style: Styles.recommendationText,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
