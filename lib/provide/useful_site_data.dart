
import 'package:flutter/material.dart';
import 'package:flutter_rush/model/useful_site_entity.dart';
import 'package:flutter_rush/network/http_utils.dart';

class UsefulSiteData with ChangeNotifier {
  List<UsefulSiteEntity> _usefulSite;

  List<UsefulSiteEntity> get usefulSite => _usefulSite;


  void changeData() async {
    HttpUtils().requestUsefulSite().then((value) {
      _usefulSite = value;
      notifyListeners();
    });
  }
}