import 'package:flutter/material.dart';

class FloatButtonProvider with ChangeNotifier {
  bool _inTop = true;

  bool get inTop => _inTop;

  ScrollController _controller;

  ScrollController get controller => _controller;

  void changeTop(bool value, ScrollController controller) {
    _inTop = value;
    _controller = controller;
    notifyListeners();
  }

  void backTop(){
    controller.animateTo(.0,  duration: Duration(milliseconds: 600),
        curve: Curves.ease);
  }
}
