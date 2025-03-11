import 'dart:async';
import 'package:flutter/material.dart';

/// ⏳ **[Debounce]** - Utility class for handling debounced actions.
/// Ensures that a function is only executed after a specified delay
/// since the last time it was invoked.
class Debounce {
  /// ⏱ **Delay duration** (default: `500ms`).
  final int milliseconds;

  Timer? _timer;

  /// 🆕 **Constructor** (optional: `milliseconds` delay).
  Debounce({this.milliseconds = 500});

  /// 🚀 **Runs the provided action** after the debounce delay.
  /// If called again within the delay, the previous call is canceled.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
