import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/RootScreen/RootScreenModel.dart';

class RootScreenVM extends RootScreenModel {
  RootScreenVM() {
    selectedIndex = 0;
    previousIndex = 0;
  }

  void updateSelectedIndex(int index) {
    try {
      previousIndex = selectedIndex;
      selectedIndex = index;

      switch (index) {
        case 1:
          updateIsAiAssistantScreenCalled(true);
          break;
        case 2:
          updateIsHistoryScreenCalled(true);
          break;
        case 3:
          updateIsProfileScreenCalled(true);
          break;
      }
    } on Exception catch (ex) {
      ex.logException();
    }
  }

  void updatePreviousIndex() {
    selectedIndex = previousIndex;
  }

  void updateIsHistoryScreenCalled(bool value) {
    isHistoryScreenCalled = value;
  }

  void updateIsAiAssistantScreenCalled(bool value) {
    isAiAssistantScreenCalled = value;
  }

  void updateIsProfileScreenCalled(bool value) {
    isProfileScreenCalled = value;
  }
}
