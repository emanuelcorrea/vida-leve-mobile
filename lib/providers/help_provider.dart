import 'package:flutter/material.dart';

class HelpProvider extends ChangeNotifier {
  late dynamic _chatContext;

  dynamic get chatContext => _chatContext;

  HelpProvider() {
    _chatContext = [];
  }

  setContext(dynamic newContext) {
    _chatContext = newContext;
    notifyListeners();
  }
}
