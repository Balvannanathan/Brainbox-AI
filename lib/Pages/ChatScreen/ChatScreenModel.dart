import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:flutter/material.dart';

class ChatScreenModel extends ChangeNotifier {
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
