import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'dart:async';
import 'dart:math';

Widget defaultUI(FijkPlayer player, FijkData data, BuildContext context,
    Size viewSize, Rect texturePos) {
  return _DefaultFijkPanel(
      player: player,
      buildContext: context,
      viewSize: viewSize,
      texturePos: texturePos);
}

/// Default Panel Widget
class _DefaultFijkPanel extends StatefulWidget {
  // 自定义变量
  final FijkPlayer player;
  final BuildContext buildContext;
  final Size viewSize;
  final Rect texturePos;
  // 接收参数
  const _DefaultFijkPanel({
    @required this.player,
    this.buildContext,
    this.viewSize,
    this.texturePos,
  });

  @override
  _DefaultFijkPanelState createState() => _DefaultFijkPanelState();
}

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

class _DefaultFijkPanelState extends State<_DefaultFijkPanel> {
  FijkPlayer get player => widget.player;

  Duration _duration = Duration();
  Duration _currentPos = Duration();
  Duration _bufferPos = Duration(); // 缓冲

  bool _playing = false;
  bool _prepared = false; // prepareAsync 后台任务是否执行完成，完成后播放器状态也对应转变为 prepared
  String _exception; // 播放器进入 error 状态的具体原因

  // bool _buffering = false;

  double _seekPos = -1.0;

  StreamSubscription _currentPosSubs; // 当前播放位置

  StreamSubscription _bufferPosSubs; // 缓冲位置
  //StreamSubscription _bufferingSubs;

  Timer _hideTimer;
  bool _hideStuff = true;

  double _volume = 1.0;

  final barHeight = 40.0;

  @override
  void initState() {
    super.initState();

    _duration = player.value.duration; // 视频长度
    _currentPos = player.currentPos; // 当前播放位置
    _bufferPos = player.bufferPos; // 当前缓冲位置
    _prepared = player.state.index >= FijkState.prepared.index;
    _playing = player.state == FijkState.started; // 是否正在播放
    _exception = player.value.exception.message;
    // _buffering = player.isBuffering;

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

  void _playOrPause() {
    if (_playing == true) {
      player.pause();
    } else {
      player.start();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _hideTimer?.cancel();

    player.removeListener(_playerValueChanged);
    _currentPosSubs?.cancel();
    _bufferPosSubs?.cancel();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
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

  Widget _buildVolumeButton() {
    IconData iconData;
    if (_volume <= 0) {
      iconData = Icons.volume_off;
    } else {
      iconData = Icons.volume_up;
    }
    return IconButton(
      icon: Icon(iconData),
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      onPressed: () {
        setState(() {
          _volume = _volume > 0 ? 0.0 : 1.0;
          player.setVolume(_volume);
        });
      },
    );
  }

  AnimatedOpacity _buildBottomBar(BuildContext context) {
    double duration = _duration.inMilliseconds.toDouble();
    double currentValue =
        _seekPos > 0 ? _seekPos : _currentPos.inMilliseconds.toDouble();
    currentValue = min(currentValue, duration);
    currentValue = max(currentValue, 0);
    return AnimatedOpacity(
      opacity: _hideStuff ? 0.0 : 0.8,
      duration: Duration(milliseconds: 400),
      child: Container(
        height: barHeight,
        color: Colors.red,
        child: Row(
          children: <Widget>[
            _buildVolumeButton(),
            Padding(
              padding: EdgeInsets.only(right: 5.0, left: 5),
              child: Text(
                '${_duration2String(_currentPos)}',
                style: TextStyle(fontSize: 14.0),
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

            // duration / position
            _duration.inMilliseconds == 0
                ? Container(child: const Text("LIVE"))
                : Padding(
                    padding: EdgeInsets.only(right: 5.0, left: 5),
                    child: Text(
                      '${_duration2String(_duration)}',
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),

            IconButton(
              icon: Icon(widget.player.value.fullScreen
                  ? Icons.fullscreen_exit
                  : Icons.fullscreen),
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
//              color: Colors.transparent,
              onPressed: () {
                widget.player.value.fullScreen
                    ? player.exitFullScreen()
                    : player.enterFullScreen();
              },
            )
            //
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Rect rect = player.value.fullScreen
        ? Rect.fromLTWH(0, 0, widget.viewSize.width, widget.viewSize.height)
        : Rect.fromLTRB(
            max(0.0, widget.texturePos.left),
            max(0.0, widget.texturePos.top),
            min(widget.viewSize.width, widget.texturePos.right),
            min(widget.viewSize.height, widget.texturePos.bottom));
    return Positioned.fromRect(
      rect: rect,
      child: GestureDetector(
        onTap: _cancelAndRestartTimer,
        child: AbsorbPointer(
          absorbing: _hideStuff,
          child: Column(
            children: <Widget>[
              Container(height: barHeight),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _cancelAndRestartTimer();
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                        child: _exception != null
                            ? Text(
                                _exception,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              )
                            : (_prepared ||
                                    player.state == FijkState.initialized)
                                ? AnimatedOpacity(
                                    opacity: _hideStuff ? 0.0 : 0.7,
                                    duration: Duration(milliseconds: 400),
                                    child: IconButton(
                                        iconSize: barHeight * 2,
                                        icon: Icon(
                                            _playing
                                                ? Icons.pause
                                                : Icons.play_arrow,
                                            color: Colors.white),
                                        padding: EdgeInsets.only(
                                            left: 10.0, right: 10.0),
                                        onPressed: _playOrPause))
                                : SizedBox(
                                    width: barHeight * 1.5,
                                    height: barHeight * 1.5,
                                    child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                            Colors.white)),
                                  )),
                  ),
                ),
              ),
              _buildBottomBar(context),
            ],
          ),
        ),
      ),
    );
  }
}
