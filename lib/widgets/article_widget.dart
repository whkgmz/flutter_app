import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/page/browser_page.dart';
import 'package:flutter_rush/utils/global_utils.dart';

class ArticleWidget extends StatefulWidget {
  final bool top;

  final ArticleModel initData;


  const ArticleWidget({Key key, this.initData, this.top})
      : super(key: key);

  @override
  _ArticleWidgetState createState() => _ArticleWidgetState();
}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildItem(context, widget.initData);
  }

  Widget _buildItem(BuildContext context, ArticleModel article) {
    return Container(
      width: GlobalUtils.calcScreenWidth(),
      height: GlobalUtils.calcWidgetHeightMultiple(0.15),
      child: GestureDetector(
        onTap: () =>_tapArticle(widget.initData),
        child: Card(
          color: widget.top ? Colors.white30 : Colors.tealAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      article.author.isEmpty ? article.shareUser : article.author,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  Expanded(
                    child: SizedBox.shrink(),
                  ),
                  Padding(
                    child: Text(article.niceDate,
                        style: Theme.of(context).textTheme.caption),
                    padding: const EdgeInsets.only(right: 8, top: 8),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: ArticleTitleWidget(article.title),
              ),
              Row(
                children: <Widget>[
                  if (widget.top)
                    ArticleTag(
                      "置顶",
                      color: Colors.red,
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    child: Text(
                      (article != null ? article.superChapterName + ' · ' : '') +
                          (article.chapterName ?? ''),
                      style: Theme.of(context).textTheme.overline,
                    ),
                  ),
                ],
              ),
            ],
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          clipBehavior: Clip.antiAlias,
        ),
      )

    );
  }
  void _tapArticle(ArticleModel model)  {
     Navigator.of(this.context).push(MaterialPageRoute(builder: (_) {
      return Browser(
        title: model.title,
        url: model.link,
      );
    }));

  }
}

class ArticleTitleWidget extends StatelessWidget {
  final String title;

  ArticleTitleWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Html(
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      useRichText: false,
      data: title,
      defaultTextStyle: Theme.of(context).textTheme.subtitle,
    );
  }
}

class ArticleTag extends StatelessWidget {
  final String text;
  final Color color;

  ArticleTag(this.text, {this.color});

  @override
  Widget build(BuildContext context) {
    var themeColor = color ?? Theme.of(context).accentColor;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3,
        vertical: 0.5,
      ),
      margin: EdgeInsets.only(right: 5, left: 8),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: color ?? themeColor)),
      child: Text(text,
          style: TextStyle(color: color ?? themeColor, fontSize: 10)),
    );
  }
}
