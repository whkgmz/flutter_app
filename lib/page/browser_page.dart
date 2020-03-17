import 'package:flutter/material.dart';
import 'package:flutter_rush/widgets/wait_dots.dart';
import 'package:webview_flutter/webview_flutter.dart';

typedef OnFinishCallBack();

class Browser extends StatefulWidget {
  final String url, title;

  const Browser({Key key, this.url, this.title}) : super(key: key);

  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {
  bool _isLoad = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            WebView(
              onPageFinished: (isn) {
                setState(() {
                  _isLoad = false;
                });
              },
              gestureNavigationEnabled: true,
              initialUrl: widget.url,
              javascriptMode: JavascriptMode.unrestricted,
            ),
            _isLoad
                ? WaitDots(
              color: Colors.red,
            )
                : Container()
          ],
        ));
  }
}
