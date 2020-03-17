import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  SkeletonBox(
      {@required this.width, @required this.height, this.isCircle: false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Divider.createBorderSide(context, width: 0.7);
    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(isCircle: isCircle, isDark: isDark),
    );
  }
}

class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle: false,
    isDark: false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}

class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration()
      : super(border: Border(bottom: BorderSide(width: 0.3)));
}

class SkeletonBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      child: Swiper(
        itemCount: 3,
        viewportFraction: 0.8,
        scale: 0.9,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            child: Shimmer.fromColors(
                period: Duration(milliseconds: 1200),
                child: Container(
                  color: Colors.white,
                ),
                baseColor: Colors.grey[350],
                highlightColor: Colors.grey[200]),
            clipBehavior: Clip.antiAlias,
          );
        },
      ),
      constraints: BoxConstraints.loose(Size(
          GlobalUtils.calcScreenWidth(),
          GlobalUtils.calcWidgetHeightMultiple(0.25))),
    );
  }
}

class SkeletonSite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: GlobalUtils.calcWidgetHeightMultiple(0.12),
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
                margin: EdgeInsets.all(9),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
                clipBehavior: Clip.hardEdge,
                child: Shimmer.fromColors(
                    child: Container(
                      color: Colors.white,
                      width: GlobalUtils.calcWidgetWidthMultiple(0.5),
                    ),
                    baseColor: Colors.grey[350],
                    highlightColor: Colors.grey[200]));
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}

class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final IndexedWidgetBuilder builder;

  SkeletonList(
      {this.length: 6,
      this.padding = const EdgeInsets.all(7),
      @required this.builder});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
        child: Padding(
            padding: padding,
            child: Column(
              children:
              List.generate(length, (index) => builder(context, index)),
            ))
    );
  }
}
