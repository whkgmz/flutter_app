import 'package:flutter/material.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/provide/main_article_provider.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/skeleton.dart';
import 'package:flutter_rush/widgets/skeleton_wait.dart';

import 'article_widget.dart';

class TopArticle extends StatelessWidget {
  static const String TITLE = "Article";

  final List<ArticleModel> articleModel;

  TopArticle({Key key, this.articleModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, i) {
        return ArticleWidget(
          initData: articleModel[i],
          top: true,
        );
      }, childCount: articleModel.length),
    );
  }
}

class MainNormalArticle extends StatelessWidget {
  final List<ArticleModel> mainArticle;
  final MainArticleProvider mainArticleProvider;

  MainNormalArticle(this.mainArticle, this.mainArticleProvider);

  @override
  Widget build(BuildContext context) {
    if (mainArticle == null || mainArticle.isEmpty) {
      return SliverToBoxAdapter(
        child: SkeletonList(
          builder: (context, index) => ArticleSkeletonItem(),
        ),
      );
    } else {
      return SliverList(
        delegate: SliverChildBuilderDelegate((context, i) {
          if (i == mainArticle.length) {
            if (mainArticleProvider.mainArticle.curPage == mainArticleProvider.mainArticle.pageCount) {
              return Container(
                height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                child: Center(
                  child: Text("没有更多数据"),
                ),
              );
            } else {
              mainArticleProvider.getMainArticle(mainArticleProvider.mainArticle.curPage.toString());

              return Container(
                height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black12,
                  ),
                ),
              );
            }
          }
          if(mainArticleProvider.mainArticle.total>i){
            return ArticleWidget(
              initData: mainArticle[i],
              top: false,
            );
          }else{
            return SizedBox();
          }

        }, childCount: mainArticle.length + 1),
      );
    }
  }
}
