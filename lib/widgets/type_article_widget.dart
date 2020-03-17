import 'package:flutter/material.dart';
import 'package:flutter_rush/provide/type_artcle_provider.dart';
import 'package:flutter_rush/utils/global_utils.dart';
import 'package:flutter_rush/widgets/skeleton.dart';
import 'package:flutter_rush/widgets/skeleton_wait.dart';
import 'package:provider/provider.dart';

import 'article_widget.dart';

class TypeArticleWidget extends StatefulWidget {
  final aid;

  const TypeArticleWidget({Key key, this.aid}) : super(key: key);
  @override
  _TypeArticleWidgetState createState() => _TypeArticleWidgetState();
}

class _TypeArticleWidgetState extends State<TypeArticleWidget> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();
    Future.microtask(()=>Provider.of<TypeArticleProvider>(context,listen: false).getTypeArticle("1", widget.aid.toString()));
  }
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return RefreshIndicator(
      color: Colors.red,
      onRefresh: _refresh,
      child: Consumer<TypeArticleProvider>(
        builder: (BuildContext context, TypeArticleProvider value, Widget child) {
          if(value.mainArticle==null){
            return SkeletonList(
              builder: (context, index) => ArticleSkeletonItem(),
            );
          }else{
            return ListView.builder(itemBuilder: (context,i){
              if(i==value.map[widget.aid.toString()].length){
                if(value.mainArticle.curPage == value.mainArticle.pageCount){
                  return Container(
                    height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                    child: Center(child: Text("没有更多数据"),),
                  );
                }else{
                  value.getTypeArticle((value.mainArticle.curPage+1).toString(), widget.aid.toString());

                  return Container(
                    height: GlobalUtils.calcWidgetHeightMultiple(0.1),
                    child: Center(child: CircularProgressIndicator(backgroundColor: Colors.black12,),),
                  );
                }
              }
              if(value.mainArticle.total>i){
                return ArticleWidget(
                  initData: value.map[widget.aid.toString()][i],
                  top: false,
                );
              }else{
                return SizedBox();
              }

            },itemCount: value.map[widget.aid.toString()].length+1,);
          }
        },

      ),

    );
  }

  Future<void> _refresh() async {
     Future.microtask(()=>Provider.of<TypeArticleProvider>(context,listen: false).refreshData("1", widget.aid.toString()));

  }

  @override
  bool get wantKeepAlive => true;
}
