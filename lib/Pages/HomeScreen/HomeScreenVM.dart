import 'package:brainbox_ai/Helpers/Navigations/NavigationConfig.dart';
import 'package:brainbox_ai/Pages/HomeScreen/HomeScreenModel.dart';

class HomeScreenVM extends HomeScreenModel {
  void navigateToChatScreen() {
    push(NavigationConfig.chatScreen);
  }

  void navigateBack() {
    pop();
  }
}
