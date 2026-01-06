import 'NavigationHelper.dart';
import 'NavigationConfig.dart';

mixin NavigationMixin {
  /// Push a new screen
  void push(ScreenConfig config, {dynamic data}) {
    NavigationHelper.push(config, data: data);
  }

  /// Replace current screen
  void pushReplace(ScreenConfig config, {dynamic data}) {
    NavigationHelper.pushReplace(config, data: data);
  }

  /// Clear stack and push
  void pushAndClear(ScreenConfig config, {dynamic data}) {
    NavigationHelper.pushAndClear(config, data: data);
  }

  /// Pop current screen
  void pop<T>({T? result}) {
    NavigationHelper.pop(result: result);
  }

  /// Check if can pop
  bool canPop() => NavigationHelper.canPop();
}
