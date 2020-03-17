import 'package:flutter/cupertino.dart';

class AnimationFloat extends StatelessWidget {
  final Widget child;

  const AnimationFloat({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (widget,animated)=>ScaleTransition(scale: animated,
        child: child,

      ),
      child: child,
    );
  }
}
