import 'package:flutter/material.dart';
import 'package:flutter_rush/model/main_article.dart';
import 'package:flutter_rush/network/http_utils.dart';
import 'package:flutter_rush/utils/log_utils.dart';

class TypeArticleProvider with ChangeNotifier {
  MainArticle _mainArticle;

  MainArticle get mainArticle => _mainArticle;

  Map<String, List<ArticleModel>> _map;

  Map get map => _map;


  void getTypeArticle(String page, String cid) async {
    HttpUtils().requestTypeArticle(page, cid).then((onValue) {
      _mainArticle = onValue;
      if (_map == null) {
        _map = Map();
      }
      if (_map[cid] != null ) {
        _map[cid].addAll(onValue.datas);
      } else {
        _map[cid] = onValue.datas;
      }
      notifyListeners();
    });
  }

  Future<void> refreshData(String page, String cid) async {
    LogUtil.d("刷新");
    await HttpUtils().requestTypeArticle(page, cid).then((onValue) {
      if (_mainArticle != null) {
        _mainArticle = null;
      }
      _mainArticle = onValue;
      if(_map[cid].isNotEmpty){
        _map[cid].clear();
        _map[cid]=onValue.datas;
      }
      notifyListeners();
    });
  }
}
