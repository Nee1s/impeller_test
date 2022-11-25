import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer();

  Timer? _ticker;
  static const Duration _time = Duration(seconds: 1);

  void run(VoidCallback exec) {
    _ticker?.cancel();
    _ticker = Timer(_time, exec);
  }

  void cancel() => _ticker?.cancel();
}
