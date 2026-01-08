import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Navigations/NavigationMixin.dart';
import 'package:brainbox_ai/Services/ChatService/IChatService.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChatScreenModel extends ChangeNotifier with NavigationMixin {
  final IChatService chatService = GetIt.instance.get<IChatService>();

  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  late ChatBO? chatBO;

  void setChatBO(ChatBO value) {
    chatBO = value;
    notifyListeners();
  }
}
