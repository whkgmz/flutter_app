import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void initState() {}

  @override
  void didChangeDependencies() {}
}
