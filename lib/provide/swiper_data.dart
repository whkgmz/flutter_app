import 'package:flutter/material.dart';
import 'package:flutter_rush/model/banner_model.dart';
import 'package:flutter_rush/network/http_utils.dart';

class SwiperData with ChangeNotifier {
  List<BannerModel> _bannerModel;


  List<BannerModel> get bannerModel => _bannerModel;


  void changeData() async {
    print("change");
    HttpUtils().requestBanner().then((value) {
      if(_bannerModel!=null){
        _bannerModel=null;
      }
      _bannerModel = value;
      notifyListeners();
    });
  }
}
