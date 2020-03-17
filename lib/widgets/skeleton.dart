import 'package:flutter/material.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/skeleton_wait.dart';
import 'package:shimmer/shimmer.dart';

class ArticleSkeletonItem extends StatelessWidget {
  final int index;

  ArticleSkeletonItem({this.index: 0});

  @override
  Widget build(BuildContext context) {
    var width = GlobalUtils.calcScreenWidth();
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
        width: GlobalUtils.calcScreenWidth(),
        height: GlobalUtils.calcWidgetHeightMultiple(0.15),
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          clipBehavior: Clip.antiAlias,
          child: Shimmer.fromColors(
            period: Duration(milliseconds: 1200),
            baseColor: isDark ? Colors.grey[700] : Colors.grey[350],
            highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //名字占位
                    Container(
                      margin: EdgeInsets.only(left: 8,top: 10),
                      height: 5,
                      width: 100,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                    Expanded(child: SizedBox.shrink()),
                    //时间占位
                    Container(
                      margin: EdgeInsets.only(right: 8,top: 10),
                      height: 5,
                      width: 30,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 6.5,
                      width: width * 0.7,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 6.5,
                      width: width * 0.8,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8),
                      height: 6.5,
                      width: width * 0.5,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10,left: 8),
                      height: 8,
                      width: 20,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                    Container(
                      height: 8,
                      width: 80,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                    Expanded(child: SizedBox.shrink()),
                    Container(
                      margin: EdgeInsets.only(right: 8),
                      height: 20,
                      width: 20,
                      decoration: SkeletonDecoration(isDark: isDark),
                    ),
                  ],
                ),
              ],
            ),

          ),

        ));
  }
}
