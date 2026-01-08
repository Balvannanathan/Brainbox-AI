import 'package:brainbox_ai/Helpers/Navigations/NavigationConfig.dart';
import 'package:brainbox_ai/Helpers/Utility/ErrorHandling.dart';
import 'package:brainbox_ai/Pages/ProfileScreen/ProfileScreenModel.dart';

class ProfileScreenVM extends ProfileScreenModel {
  void navigateToCustomerSupport() {
    try {
      push(NavigationConfig.preferenceScreen);
    } on Exception catch (e) {
      e.logException();
    }
  }

  void navigateToPreferences() {
    try {
      push(NavigationConfig.preferenceScreen);
    } on Exception catch (e) {
      e.logException();
    }
  }
}
