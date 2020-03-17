import 'package:flutter/cupertino.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/network/http_utils.dart';

class MainArticleProvider with ChangeNotifier {
  MainArticle _mainArticle;

  MainArticle get mainArticle => _mainArticle;

  List<ArticleModel> _model;

  List<ArticleModel> get model => _model;

  void getMainArticle(String page) async {
    HttpUtils().requestMainArticle(page).then((onValue) {
      _mainArticle = onValue;
      if(_model==null){
        _model =onValue.datas;
      }else{
        _model.addAll(onValue.datas);
      }
      notifyListeners();
    });
  }

  void refreshData(String page) async {
    HttpUtils().requestMainArticle(page).then((onValue) {
      if (_mainArticle !=null){
        _mainArticle=null;
      }
      _mainArticle = onValue;
      if(_model!=null){
        _model = null;
      }
      _model=onValue.datas;
      notifyListeners();
    });

  }
}
