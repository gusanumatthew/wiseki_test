import 'package:flutter/foundation.dart';
import 'dart:developer';

void debugLog<T>(T value) {
  if (kDebugMode) {
    log("[DEBUG]==> $value");
  }
}
