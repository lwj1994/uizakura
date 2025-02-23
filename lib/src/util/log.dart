import "package:logger/logger.dart" as loggerlib;
import 'package:uizakura/uizakura.dart';

/// @author luwenjie on 2024/2/27 15:43:53

class Logger {
  static void initialize() async {}

  static void clear() {}

  static Future<void> print(String tag, String s) async {
    if (UizakuraAppEnv.isDebug) {
      debugLogger.d(
          "\n$tag:-------------------------\n$s\n-------------------------\n");
    }
  }
}

final debugLogger = loggerlib.Logger(
  filter: _DevelopmentFilter(),
  printer: loggerlib.PrettyPrinter(methodCount: 1),
);

class _DevelopmentFilter extends loggerlib.LogFilter {
  @override
  bool shouldLog(loggerlib.LogEvent event) {
    return UizakuraAppEnv.isDebug;
  }
}
