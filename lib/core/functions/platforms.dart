import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;

String get patternPath {
  return Platform.isWindows ? '\\' : '/';
}

bool get isWeb {
  return kIsWeb;
}

bool get isMobile {
  if (Platform.isAndroid || Platform.isIOS) {
    return true;
  }

  return false;
}

bool get isDisktop {
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return true;
  }
  return false;
}
