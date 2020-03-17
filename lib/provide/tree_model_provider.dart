import 'package:flutter/material.dart';
import 'package:flutter_rush/model/tree_model.dart';
import 'package:flutter_rush/network/http_utils.dart';

class TreeModelProvider with ChangeNotifier{
  List<TreeModel> _treeModel;
  List<TreeModel> get treeModel => _treeModel;

  void requestTree() async{
    HttpUtils().requestTreeModel().then((onValue){
      _treeModel = onValue;
      notifyListeners();
    });
  }
}