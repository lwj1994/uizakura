import 'package:uizakura/src/util/string_extension.dart';

/// @author luwenjie on 2023/9/14 23:11:19

class UiaraFileUtil {
  UiaraFileUtil._();

  static getName(String path) {
    String name = path.substringAfterLast('/');
    if (name.isEmpty) {
      return path;
    }
    if (name.contains(".")) {
      name = name.substringBeforeLast(".");
    }
    return name;
  }
}
