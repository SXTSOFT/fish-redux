import 'package:flutter/foundation.dart';

import '../redux/redux.dart';

/// for debug or report
enum $DebugOrReport {
  debugUpdate,
  reportBuildError,
  reportSetStateError,
  reportOtherError,
}

class $DebugOrReportCreator {
  static FAction debugUpdate(String name) =>
      FAction($DebugOrReport.debugUpdate, payload: name);

  static FAction reportBuildError(Object exception, StackTrace stackTrace) =>
      FAction($DebugOrReport.reportBuildError,
          payload: flutterErrorDetails(exception, stackTrace));

  static FAction reportSetStateError(
          FlutterError exception, StackTrace stackTrace) =>
      FAction($DebugOrReport.reportSetStateError,
          payload: flutterErrorDetails(exception, stackTrace));

  static FAction reportOtherError(
          FlutterError exception, StackTrace stackTrace) =>
      FAction($DebugOrReport.reportOtherError,
          payload: flutterErrorDetails(exception, stackTrace));

  static FlutterErrorDetails flutterErrorDetails(
      Object exception, StackTrace stackTrace) {
    return FlutterErrorDetails(
      exception: exception,
      stack: stackTrace,
      library: 'fish-redux',
    );
  }
}

/// action-type which starts with '$' should be interruptted,
/// like $DebugOrReport
bool shouldBeInterrupttedBeforeReducer(FAction action) {
  final Object actionType = action.type;
  return actionType != null && actionType.toString().startsWith('\$');
}
