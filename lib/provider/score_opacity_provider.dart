import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScoreOpacityProvider extends ChangeNotifier {
  double _opacityLevel = 1.0;
  Timer? _timer;

  ScoreOpacityProvider() {
    _startTimer();
  }

  double get opacityLevel => _opacityLevel;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _opacityLevel = _opacityLevel == 0 ? 1.0 : 0.0;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    // Dispose the timer when the provider is disposed
    _timer?.cancel();
    super.dispose();
  }
}

