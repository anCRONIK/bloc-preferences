import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'dependency_injection.dart';

void initLogger(Environment environment) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final time = DateTime.now().toIso8601String();
    final msg = '[$time ${record.level} ${record.loggerName}] ${record.message}';
    /*switch (record.level) {
      case Level.SHOUT: msg..white()..bgRed(); break;
      case Level.SEVERE: msg.lightRed(); break;
      case Level.WARNING: msg.yellow(); break;
      case Level.INFO: msg.white(); break;
      case Level.CONFIG:
      case Level.FINE:
      case Level.FINER:
      case Level.FINEST: msg.darkGray(); break;
      default:
        msg.default_slyle();
    }*/
    const bool isProductionMode = false;
    if (!isProductionMode) {
      debugPrint(msg.toString(), wrapWidth: 150);
    }
  });
}