import 'package:flutter/cupertino.dart';

class GlobalUtils {

  static MediaQueryData _data;

  factory GlobalUtils.init(BuildContext context)=> _getInstance(context);

  static GlobalUtils _instance;

  GlobalUtils._internal(BuildContext context){
    _data=MediaQuery.of(context);
  }

  static GlobalUtils _getInstance(BuildContext context){
    if(_instance == null){
      _instance =GlobalUtils._internal(context);
    }
    return _instance;

  }
  static double calcScreenWidth(){
    return _data.size.width;

  }

  static double calcWidgetWidthMultiple(double multiple) {
    return _data.size.width* multiple;

  }

  static double calcWidgetHeightMultiple(double multiple){
    return _data.size.height*multiple;

  }
}
