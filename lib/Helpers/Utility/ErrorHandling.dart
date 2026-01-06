import 'dart:developer';
import 'package:flutter/foundation.dart';

extension ExceptionLogging on Exception {
  void logException({StackTrace? stackTrace}) {
    final formattedLog =
        '''
============================================================
EXCEPTION OCCURRED
------------------------------------------------------------
Type   : ${runtimeType}
Message: $this
============================================================
''';

    if (kDebugMode || kProfileMode) {
      log(formattedLog, error: this, stackTrace: stackTrace);
    }

    if (kReleaseMode) {
      // Hook for crash reporting tools
      // FirebaseCrashlytics.instance.recordError(this, stackTrace);
    }
  }
}
