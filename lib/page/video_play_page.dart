import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/plugins/fijkplayer/lib/fijkplayer.dart';
import 'package:flutter_rush/widgets/video/controllerUI.dart';
// import 'package:flutter_rush/widgets/video/aa.dart';

class VideoPlayPage extends StatefulWidget {
  // 路由入参
  final String url;
  VideoPlayPage({this.url});

  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  final FijkPlayer player = FijkPlayer();
  @override
  void initState() {
    super.initState();
    print('王洪魁' + widget.url);
    player.setDataSource(
        //'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
        //'asset:///assets/video/whk.mp4',
        widget.url,
        // 'https://fop-hotcamp-resource.rjfittime.com/project/1583825445230.mp4',
        autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release(); // dispose 清除播放器
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FijkView(
            player: player,
            fit: FijkFit.cover,
            fsFit: FijkFit.contain, // 全屏之后设置
            color: Colors.black,
            // 自定义控制器UI
            panelBuilder: (FijkPlayer player, playData, BuildContext context,
                Size viewSize, Rect texturePos) {
              return controllerUI(
                  player, playData, context, viewSize, texturePos);
            }),
      ),
      //     body: Stack(
      //   children: <Widget>[
      //     FijkView(
      //         player: player,
      //         fit: FijkFit.cover,
      //         fsFit: FijkFit.cover, // 全屏之后设置
      //         // 自定义控制器UI
      //         panelBuilder: (FijkPlayer player, playData, BuildContext context,
      //             Size viewSize, Rect texturePos) {
      //           return controllerUI(
      //               player, playData, context, viewSize, texturePos);
      //         })
      //   ],
      // )
    );
  }
}
