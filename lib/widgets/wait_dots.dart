import 'package:flutter/widgets.dart';

class WaitDots extends StatefulWidget {
  const WaitDots({
    Key key,
    this.color,
    this.size = 20.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2000),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
  '必须设置颜色或是itemBuilder'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _WaitDotsState createState() => _WaitDotsState();
}

class _WaitDotsState extends State<WaitDots> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);
    _animation = Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: List.generate(2, (i) {
          return Transform.scale(
            scale: (1.0 - i - _animation.value).abs(),
            child: SizedBox.fromSize(size: Size.square(widget.size), child: _itemBuilder(i)),
          );
        }),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(shape: BoxShape.circle, color: widget.color.withOpacity(0.6)));
}