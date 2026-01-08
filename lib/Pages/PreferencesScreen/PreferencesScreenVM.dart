import 'package:brainbox_ai/Helpers/Navigations/NavigationConfig.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/PreferencesScreen/PreferencesScreenModel.dart';

class PreferencesScreenVM extends PreferencesScreenModel {
  void navigateBack() {
    try {
      pop();
    } on Exception catch (e) {
      e.logException();
    }
  }

  void navigateToEditProfile() {
    try {
      push(NavigationConfig.editProfileScreen);
    } on Exception catch (e) {
      e.logException();
    }
  }
}
