import 'package:flutter/material.dart';
import 'package:flutter_rush/plugins/fijkplayer/lib/fijkplayer.dart';
import 'dart:async';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // 布局包
// import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/routers/router_util.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rush/provide/video_provider_model.dart';
import 'package:screen/screen.dart';
import 'package:flutter/services.dart';

Widget controllerUI(FijkPlayer player, FijkData data, BuildContext context,
    Size viewSize, Rect texturePos) {
  return _ControllerWidget(
      player: player,
      buildContext: context,
      viewSize: viewSize,
      texturePos: texturePos);
}

class _ControllerWidget extends StatefulWidget {
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;

  // 接收参数
  const _ControllerWidget({
    @required this.player,
    this.buildContext,
    this.viewSize,
    this.texturePos, // 定义视频页面
  });
  @override
  __ControllerWidgetState createState() => __ControllerWidgetState();
}

/// 计算时间
String _duration2String(Duration duration) {
  if (duration.inMilliseconds < 0) return "-: negtive";

  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  int inHours = duration.inHours;
  return inHours > 0
      ? "$inHours:$twoDigitMinutes:$twoDigitSeconds"
      : "$twoDigitMinutes:$twoDigitSeconds";
}

class __ControllerWidgetState extends State<_ControllerWidget> {
  FijkPlayer get player => widget.player; // 获取player 对象
  // bool isPlaying = player.state == FijkState.started;

  // 统一变量命名
  Duration _duration = Duration();
  Duration _currentPos = Duration();
  Duration _bufferPos = Duration();
  bool isPlaying = true;
  bool _playing = false; // 播放状态
  bool _prepared = false; // prepareAsync 后台任务是否执行完成，完成后播放器状态也对应转变为 prepared
  bool _fullScreen = false; // 是否全屏
  bool _collect = false; // 是否收藏
  bool _like = false; // 是否点赞
  String _exception; // 播放器进入 error 状态的具体原因
  double _seekPos = -1.0; // 视频跳转
  //？？？？？？Timer _hideTimer; //
  Timer _hideTimer;
  bool _hideStuff = true; // 控制UI显示和隐藏
  StreamSubscription _currentPosSubs; // 当前播放位置
  StreamSubscription _bufferPosSubs; // 缓冲位置
  double _volume = 1.0; // 是否静音  0 - 1
  List speedList = [0.5, 1.0, 1.5, 2.0];
  double _speed = 1.0;
  bool _mask = false; // 遮罩层

  double movePan; // 偏移量累计总和
  Offset startPosition; // 起始位置
  double layoutWidth; // 组件宽度
  double layoutHeight; // 组件高度
  double brightness = 0.0; //亮度
  String volumePercentage = ''; // 组件位移描述
  bool moveToastFlag = false;

  @override
  void initState() {
    super.initState();
    // print(Provider.of<VideoProviderModel>(context, listen: false).videoList);
    _duration = player.value.duration; // 视频长度
    _fullScreen = player.value.fullScreen; // 视频长度
    _currentPos = player.currentPos; // 当前播放位置
    _bufferPos = player.bufferPos; // 当前缓冲位置
    _prepared = player.state.index >= FijkState.prepared.index;
    _playing = player.state == FijkState.started; // 视频播放状态
    _exception = player.value.exception.message; // 报错信息
    _speed = Provider.of<VideoProviderModel>(context, listen: false).speed;
    // _buffering = player.isBuffering;
    //_like = Provider.of<VideoProviderModel>(context).like;

    // 监听视频变化
    player.addListener(_playerValueChanged);

    // 订阅 Stream ，在结束或者不需要使用时应当取消订阅
    _currentPosSubs = player.onCurrentPosUpdate.listen((v) {
      setState(() {
        _currentPos = v;
      });
    });
    // 订阅 Stream ，在结束或者不需要使用时应当取消订阅
    _bufferPosSubs = player.onBufferPosUpdate.listen((v) {
      setState(() {
        _bufferPos = v;
      });
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    _reset(context);
  }

  void _reset(BuildContext context) {
    startPosition = Offset(0, 0);
    movePan = 0;
    layoutHeight = context.size.height;
    layoutWidth = context.size.width;
    //volumePercentage = '';
  }

  void _onVerticalDragStart(details) async {
    _reset(context);
    startPosition = details.globalPosition;
    if (startPosition.dx < (layoutWidth / 2)) {
      /// 左边触摸
      await FijkPlugin.screenBrightness().then((onValue) {
        brightness = onValue;
      });

      //brightness = await Screen.brightness;
      //print(brightness);
      // brightnessOk = true;
    }
  }

  void _onVerticalDragUpdate(details) {
    // if (!videoInit) {
    //   return;
    // }

    /// 累计计算偏移量(下滑减少百分比，上滑增加百分比)
    movePan += (-details.delta.dy);
    if (startPosition.dx < (layoutWidth / 2)) {
      /// 左边触摸
      print('亮度：${(_setBrightnessValue() * 100).toInt()}%');
      setState(() {
        volumePercentage = '亮度：${(_setBrightnessValue() * 100).toInt()}%';

        moveToastFlag = true;
      });
    } else {
      /// 右边触摸
      /// '
      FijkVolume.getVol().then((onValue) {
        print(onValue);
        double setVolume = _setVerticalValue(onValue, num: 2);
        // print('音量：${(_setVerticalValue(num: 2) * 100).toInt()}%');
        print('音量：${(setVolume * 100).toInt()}%');
        setState(() {
          volumePercentage = '音量：${(setVolume * 100).toInt()}%';
          moveToastFlag = true;
        });
      });
    }
  }

  void _onVerticalDragEnd(_) async {
    // if (!videoInit) {
    //   return;
    // }
    if (startPosition.dx < (layoutWidth / 2)) {
      print(_setBrightnessValue());

      await Screen.setBrightness(_setBrightnessValue());
      FijkPlugin.setScreenBrightness(_setBrightnessValue());
      // 左边触摸
      // setState(() {
      //   playDialogOpacity = 0.0;
      // });
    } else {
      // 右边触摸
      await FijkVolume.getVol().then((onValue) {
        double setVolume = _setVerticalValue(onValue);
        print(setVolume);
        FijkVolume.setVol(setVolume);
        player.setVolume(setVolume);
      });
    }
    setState(() {
      moveToastFlag = false;
    });
  }

  double _setBrightnessValue() {
    // 亮度百分控制
    double value =
        double.parse((movePan / layoutHeight + brightness).toStringAsFixed(2));
    if (value >= 1.00) {
      value = 1.00;
    } else if (value <= 0.00) {
      value = 0.00;
    }
    return value;
  }

  double _setVerticalValue(volume, {int num = 1}) {
    // 声音亮度百分控制
    double value =
        double.parse((movePan / layoutHeight + volume).toStringAsFixed(num));
    if (value >= 1.0) {
      value = 1.0;
    } else if (value <= 0.0) {
      value = 0.0;
    }
    return value;
  }

  // 视频监听事件
  void _playerValueChanged() {
    FijkValue value = player.value;
    if (value.duration != _duration) {
      setState(() {
        _duration = value.duration;
      });
    }
    bool playing = (value.state == FijkState.started);
    bool prepared = value.prepared;
    String exception = value.exception.message;
    if (playing != _playing ||
        prepared != _prepared ||
        exception != _exception) {
      setState(() {
        _playing = playing;
        _prepared = prepared;
        _exception = exception;
      });
    }
  }

  // 视频暂停和���放
  void _playOrPause() {
    if (_playing == true) {
      player.pause();
    } else {
      player.start();
    }
  }

  // 全屏
  void _enterFullScreen() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await FijkPlugin.setOrientationLandscape();

    _fullScreen = true;
  }

  // 非全屏
  void _exitFullScreen() async {
    player.exitFullScreen();
    await SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    await FijkPlugin.setOrientationPortrait();
    _fullScreen = false;
  }

  // 切换视频速度
  void _switchSpeed(speed) async {
    _speed = speed;
    await player.setSpeed(speed);
    Provider.of<VideoProviderModel>(context, listen: false).changeSpeed(_speed);
    setState(() {
      _mask = false;
    });
  }

  @override
  void dispose() {
    // 销毁生命周期
    super.dispose();
    _hideTimer?.cancel(); // 取消Stream的订阅
    // 移除���听������
    player.removeListener(_playerValueChanged);
    _currentPosSubs?.cancel(); // 取消Stream的订阅
    _bufferPosSubs?.cancel();
  }

  // 控制器隐藏
  void _startHideTimer() {
    _hideTimer?.cancel();
    // ��时器
    _hideTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _hideStuff = true;
      });
    });
  }

  void _cancelAndRestartTimer() {
    if (_hideStuff == true) {
      _startHideTimer();
    }
    setState(() {
      _hideStuff = !_hideStuff;
    });
  }

  void _collectVideo() {
    Provider.of<VideoProviderModel>(context, listen: false).switchCollect();
    // setState(() {
    //   _collect = !_collect;
    // });
  }

  void _getLike() {
    Provider.of<VideoProviderModel>(context, listen: false).switchLike();
    // setState(() {
    //   _like = !_like;
    // });
  }

  Widget build(BuildContext context) {
    Rect rect = player.value.fullScreen
        ? Rect.fromLTWH(0, 0, widget.viewSize.width, widget.viewSize.height)
        : Rect.fromLTRB(
            max(0.0, widget.texturePos.left),
            max(0.0, widget.texturePos.top),
            min(widget.viewSize.width, widget.texturePos.right),
            min(widget.viewSize.height, widget.texturePos.bottom));
    return Stack(children: <Widget>[
      Positioned.fromRect(
        rect: rect,
        child: GestureDetector(
          onTap: _cancelAndRestartTimer,
          onVerticalDragStart: _onVerticalDragStart, // 上下滑动
          onVerticalDragUpdate: _onVerticalDragUpdate,
          onVerticalDragEnd: _onVerticalDragEnd,
          // onHorizontalDragStart: _onHorizontalDragStart,
          // onHorizontalDragUpdate: _onHorizontalDragUpdate,
          // onHorizontalDragEnd: _onHorizontalDragEnd,
          child: AbsorbPointer(
            // 忽略触摸事件 禁止用户输入的控件
            absorbing: _hideStuff,
            child: Column(
              children: <Widget>[
                !_fullScreen
                    ? Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(60),
                            left: ScreenUtil.getInstance().setWidth(20),
                            right: ScreenUtil.getInstance().setWidth(20)),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  onTap: () => {NavigatorUtils.goBack(context)},
                                ),
                              ],
                            )),
                            GestureDetector(
                              child:
                                  Icon(Icons.more_horiz, color: Colors.white),
                              onTap: () => print('王洪魁'),
                            )
                          ],
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil.getInstance().setHeight(45)),
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(60)),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                child: GestureDetector(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.arrow_back_ios,
                                      color: Colors.white),
                                  Text(
                                    '猫式伸展猫式伸展',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  )
                                ],
                              ),
                              onTap: () => {
                                player.exitFullScreen(), // 强制横屏
                                // SystemChrome.setPreferredOrientations([
                                //   DeviceOrientation.landscapeLeft,
                                //   DeviceOrientation.landscapeRight
                                // ])
                              },
                            )),
                            Row(
                              children: <Widget>[
                                Icon(
                                    Provider.of<VideoProviderModel>(context,
                                                listen: false)
                                            .collect
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.white),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil.getInstance()
                                          .setHeight(40)),
                                  child: Icon(
                                      !Provider.of<VideoProviderModel>(context)
                                              .like
                                          ? Icons.touch_app
                                          : Icons.fingerprint,
                                      color: Colors.white),
                                ),
                                Icon(Icons.reply, color: Colors.white),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil.getInstance()
                                          .setHeight(40)),
                                  child: Icon(Icons.more_vert,
                                      color: Colors.white),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                // !moveToastFlag
                //     ? Container()
                //     : Expanded(
                //         child: Container(
                //             width: double.infinity,
                //             height: double.infinity,
                //             // 这里需要价格透明色，不然无法响应手势，有没有大佬知道更加优雅点的方式
                //             color: Colors.transparent,
                //             child: Center(
                //               child: Text(
                //                 volumePercentage,
                //                 style: TextStyle(
                //                     color: Colors.white, fontSize: 20),
                //               ),
                //             )),
                //       ),
                Expanded(
                  child: GestureDetector(
                    onTap: _cancelAndRestartTimer,
                    child: Container(
                      color: Colors.transparent,
                      height: double.infinity, // 设置为double.infinity可以强制在高度上撑满
                      width: double.infinity,
                      child: Center(
                        child: moveToastFlag
                            ? Text(
                                volumePercentage,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            : _exception != null
                                ? Text(
                                    // 视频播放出错，屏幕显示错误信息
                                    _exception,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  )
                                : (_prepared ||
                                        player.state == FijkState.initialized)
                                    // 初始化完成状态
                                    ? AnimatedOpacity(
                                        opacity: _hideStuff ? 0.0 : 0.7,
                                        duration: Duration(milliseconds: 400),
                                        child: IconButton(
                                            iconSize: 80,
                                            icon: Icon(
                                                _playing
                                                    ? Icons.pause
                                                    : Icons.play_arrow,
                                                color: Colors.white),
                                            padding: EdgeInsets.only(
                                                left: 10.0, right: 10.0),
                                            onPressed: _playOrPause))
                                    : SizedBox(
                                        // 圆形进度加载体条 loading
                                        width: 40 * 1.5,
                                        height: 40 * 1.5,
                                        child: CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(
                                                Colors.white)),
                                      ),
                      ),
                    ),
                  ),
                ),
                __buildBottomBar(context)
              ],
            ),
          ),
        ),
      ),
      _fullScreen && _mask
          ? GestureDetector(
              onTap: () => {
                setState(() {
                  _mask = false;
                })
              },
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setWidth(40)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text('播放速度',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ),
                        speedWidget()
                      ],
                    ),
                  )),
            )
          : Container()
    ]);
  }

  // 播放速度widget
  Widget speedWidget() {
    List<Widget> speedWidgetList = []; //先建一个数组用于存放循环生成的widget
    Widget content; //单独一个widget组件，用于返回需要生成的内容widget
    if (speedList != null) {
      for (var item in speedList) {
        speedWidgetList.add(GestureDetector(
            onTap: () => {_switchSpeed(item)},
            child: Container(
              margin:
                  EdgeInsets.only(right: ScreenUtil.getInstance().setWidth(10)),
              width: ScreenUtil.getInstance().setWidth(100),
              height: ScreenUtil.getInstance().setWidth(100),
              //color: Color.fromRGBO(0, 0, 0, 0.3),
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                border: Border(
                  bottom: BorderSide(
                    width: 2, //宽度
                    color: item == _speed ? Colors.orange : Colors.black, //边框颜色
                  ),
                ),
              ),
              child: Center(
                child: Text('${item}',
                    style: TextStyle(
                        fontSize: 20,
                        color: item == _speed ? Colors.orange : Colors.white,
                        fontStyle: FontStyle.italic)),
              ),
            )));
      }
    }
    content = Row(
      children: speedWidgetList,
    );
    return content;
  }

  // 自定义控制器widget
  AnimatedOpacity __buildBottomBar(BuildContext context) {
    double duration = _duration.inMilliseconds.toDouble(); // ��取当前秒数
    // 计���当前播放的时间状态
    double currentValue =
        _seekPos > 0 ? _seekPos : _currentPos.inMilliseconds.toDouble();
    currentValue = min(currentValue, duration);
    currentValue = max(currentValue, 0);
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 0.8, // 设置渐变持续透明度
      duration: Duration(milliseconds: 400), // 设置渐变持续时间
      child: Container(
        // width: GlobalUtils.calcScreenWidth(),
        color: Color.fromRGBO(0, 0, 0, 0.3),
        padding: EdgeInsets.only(
            left: _fullScreen
                ? ScreenUtil.getInstance().setHeight(42)
                : ScreenUtil.getInstance().setWidth(42),
            right: _fullScreen
                ? ScreenUtil.getInstance().setHeight(42)
                : ScreenUtil.getInstance().setWidth(42),
            top: _fullScreen
                ? ScreenUtil.getInstance().setHeight(40)
                : ScreenUtil.getInstance().setWidth(40),
            bottom: _fullScreen
                ? ScreenUtil.getInstance().setHeight(20)
                : ScreenUtil.getInstance().setWidth(45)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('猫式伸展猫式伸展',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: _fullScreen ? 16 : ScreenUtil().setSp(32))),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(
                  vertical: _fullScreen
                      ? ScreenUtil.getInstance().setWidth(10)
                      : ScreenUtil.getInstance().setHeight(20)),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        right: _fullScreen
                            ? ScreenUtil.getInstance().setHeight(25)
                            : ScreenUtil.getInstance().setWidth(25)),
                    child: GestureDetector(
                      child: Icon(
                        _playing ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onTap: () {
                        _playing ? player.pause() : player.start();
                      },
                    ),
                  ),
                  _duration.inMilliseconds == 0
                      ? Expanded(child: Center())
                      : Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 0, left: 0),
                            child: FijkSlider(
                              value: currentValue,
                              cacheValue: _bufferPos.inMilliseconds.toDouble(),
                              min: 0.0,
                              max: duration,
                              colors: FijkSliderColors(
                                  // 自定义slider颜色
                                  playedColor: Color.fromRGBO(124, 185, 249, 1),
                                  cursorColor:
                                      Color.fromRGBO(124, 185, 249, 1)),
                              onChanged: (v) {
                                _startHideTimer();
                                setState(() {
                                  _seekPos = v;
                                });
                              },
                              onChangeEnd: (v) {
                                setState(() {
                                  player.seekTo(v.toInt());
                                  print("seek to $v");
                                  _currentPos =
                                      Duration(milliseconds: _seekPos.toInt());
                                  _seekPos = -1;
                                });
                              },
                            ),
                          ),
                        ),
                  _duration.inMilliseconds == 0
                      ? Container(child: const Text("LIVE"))
                      : Padding(
                          padding: EdgeInsets.only(
                              left: _fullScreen
                                  ? ScreenUtil.getInstance().setHeight(25)
                                  : ScreenUtil.getInstance().setWidth(40)),
                          child: Text(
                            '${_duration2String(_currentPos)}/${_duration2String(_duration)}',
                            style: TextStyle(
                                fontSize: _fullScreen
                                    ? 12
                                    : ScreenUtil.getInstance().setSp(22),
                                color: Colors.white),
                          )),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      child: Icon(
                          widget.player.value.fullScreen
                              ? Icons.fullscreen_exit
                              : Icons.fullscreen,
                          color: Colors.white),
                      onTap: () {
                        // 全屏切换
                        widget.player.value.fullScreen
                            ? player.exitFullScreen()
                            : player.enterFullScreen();
                        //_fullScreen ? _exitFullScreen() : _enterFullScreen();
                        // FijkPlugin.setOrientationLandscape();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        right: ScreenUtil.getInstance().setWidth(15)),
                    child: GestureDetector(
                      child: Icon(
                        Icons.line_style,
                        color: Colors.white,
                      ),
                      onTap: () {
                        isPlaying ? player.pause() : player.start();
                      },
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        // height: 40,

                        height: _fullScreen
                            ? 25
                            : ScreenUtil.getInstance().setHeight(50),
                        padding: EdgeInsets.symmetric(
                            horizontal: _fullScreen
                                ? ScreenUtil.getInstance().setHeight(25)
                                : ScreenUtil.getInstance().setWidth(25)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color.fromRGBO(249, 250, 255, 0.3)),
                        alignment: Alignment.center,
                        child: Center(
                          child: TextField(
                            enabled: false,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _fullScreen
                                  ? 14
                                  : ScreenUtil.getInstance().setSp(22),
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              // hintText: "弹幕��一波",
                              // 提示样式属性，用于提示文本（`hintText`）的样式。
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: _fullScreen
                                    ? 12
                                    : ScreenUtil.getInstance().setSp(22),
                              ),
                            ),
                          ),
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: _fullScreen
                            ? ScreenUtil.getInstance().setHeight(45)
                            : ScreenUtil.getInstance().setWidth(45),
                        right: _fullScreen
                            ? ScreenUtil.getInstance().setHeight(40)
                            : ScreenUtil.getInstance().setWidth(60)),
                    child: _fullScreen
                        ? GestureDetector(
                            onTap: () => {
                                  setState(() {
                                    _mask = true;
                                  })
                                },
                            child: Text(
                              '倍数',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ))
                        : Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                    !Provider.of<VideoProviderModel>(context)
                                            .like
                                        ? Icons.touch_app
                                        : Icons.fingerprint,
                                    color: Colors.white),
                                onTap: _getLike,
                              ),
                              Text('点赞',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _fullScreen
                                          ? 12
                                          : ScreenUtil.getInstance().setSp(18)))
                            ],
                          ),
                  ),
                  Container(
                    child: _fullScreen
                        ? null
                        : Column(
                            children: <Widget>[
                              GestureDetector(
                                child: Icon(
                                  Provider.of<VideoProviderModel>(context,
                                              listen: false)
                                          .collect
                                      ? Icons.star
                                      : Icons.star_border,
                                  color: Colors.white,
                                ),
                                onTap: _collectVideo,
                              ),
                              Text(_collect ? '收藏' : '收藏',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: _fullScreen
                                          ? 12
                                          : ScreenUtil.getInstance().setSp(18)))
                            ],
                          ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
