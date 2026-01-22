import 'dart:async';

import 'package:flutter/material.dart';

import 'enums.dart';

class SuperTooltipController extends ChangeNotifier {
  late Completer _completer;
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  late Event event;

  Future<void> showTooltip() {
    event = Event.show;
    _completer = Completer();
    notifyListeners();
    _isVisible = true;
    return _completer.future;
  }

  Future<void> hideTooltip() {
    event = Event.hide;
    _completer = Completer();
    notifyListeners();
    _isVisible = false;
    return _completer.future;
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}
