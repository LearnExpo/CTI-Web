import 'package:flutter/foundation.dart';

/// Global notifier for "scroll to this section on the home page."
/// Decoupled from go_router's `extra`, which only updates on an actual
/// route change — repeated taps while already on '/' don't produce a
/// new route, so `extra` never fires twice. This notifier fires every
/// single request, whether or not a navigation occurred.
class HomeScrollController extends ChangeNotifier {
  String? _target;
  int _requestId = 0;

  String? get target => _target;
  int get requestId => _requestId;

  void requestScroll(String section) {
    _target = section;
    _requestId++; // always changes, even if section is the same as last time
    notifyListeners();
  }
}

final homeScrollController = HomeScrollController();