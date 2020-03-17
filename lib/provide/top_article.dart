import 'package:flutter/material.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/network/http_utils.dart';

class TopArticleProvider with ChangeNotifier {
  List<ArticleModel> _articleModel;

  List<ArticleModel> get articleModel => _articleModel;

  void getTopArticle() async {
    HttpUtils().requestTopArticle().then((onValue){
      if(_articleModel!=null){
       _articleModel=null;
      }
      _articleModel=onValue;
      notifyListeners();
    }
    );
  }

}