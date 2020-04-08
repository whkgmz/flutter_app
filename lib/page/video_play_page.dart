import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
import 'package:flutter_rush/utils/global_utils.dart';
// import 'package:video_player/video_player.dart';
//import 'package:fijkplayer/fijkplayer.dart';

class VideoPlayPage extends StatefulWidget {
  // final String url;

  // VideoPlayPage({@required this.url});
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  //final FijkPlayer player = FijkPlayer();

  _VideoPlayPageState();

  @override
  void initState() {
    super.initState();
    //player.setDataSource(widget.url, autoPlay: true);
    // player.setDataSource(
    //     'https://fop-hotcamp-resource.rjfittime.com/30c1a286-53db-4e81-bd8d-713b2917cfa8.mp4',
    //     autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    //player.release(); // 销毁 资源释放
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          // child: FijkView(
          //   // 视频播放 UI界面
          //   player: player,
          //   fit: FijkFit.cover,
          // ),
          ),
    );
  }
}
