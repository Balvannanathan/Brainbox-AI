import 'package:brainbox_ai/BOs/ChatBO/ChatBO.dart';
import 'package:brainbox_ai/Helpers/Navigations/NavigationMixin.dart';
import 'package:brainbox_ai/Services/ChatService/IChatService.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

class HistoryScreenModel extends ChangeNotifier with NavigationMixin {
  final IChatService chatService = GetIt.instance.get<IChatService>();

  late List<ChatBO>? history;

  void setHistory(List<ChatBO> value) {
    history = value;
    notifyListeners();
  }

  late Map<String, List<ChatBO>> groupedChats;

  void setGroupedChats(Map<String, List<ChatBO>> value) {
    groupedChats = value;
    notifyListeners();
  }

  bool isLoading = false;

  void setIsLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
