import 'package:flutter/foundation.dart';

class RootScreenModel extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  int _previousIndex = 0;

  int get previousIndex => _previousIndex;

  set previousIndex(int value) {
    _previousIndex = value;
    notifyListeners();
  }

  bool _isHistoryScreenCalled = false;

  bool get isHistoryScreenCalled => _isHistoryScreenCalled;

  set isHistoryScreenCalled(bool value) {
    _isHistoryScreenCalled = value;
    notifyListeners();
  }

  bool _isAiAssistantScreenCalled = false;

  bool get isAiAssistantScreenCalled => _isAiAssistantScreenCalled;

  set isAiAssistantScreenCalled(bool value) {
    _isAiAssistantScreenCalled = value;
    notifyListeners();
  }

  bool _isProfileScreenCalled = false;

  bool get isProfileScreenCalled => _isProfileScreenCalled;

  set isProfileScreenCalled(bool value) {
    _isProfileScreenCalled = value;
    notifyListeners();
  }
}
