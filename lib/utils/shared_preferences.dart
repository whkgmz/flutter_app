import 'package:shared_preferences/shared_preferences.dart'; // 负责本地存储

class SpUtils {
  /**
   * 用户账号信息
   */
  static final String USERTOKEN = 'token';
  /**
   * 保存数据
   */
  static void set(String key, Object value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (value is String) {
      sp.setString(key, value);
    }
  }

  /**
   * 获取数据
   */
  static Future<dynamic> get(String key, Object defaultObject) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (defaultObject is String) {
      return sp.getString(key);
    }
  }

  /**
   * 清除存储信息
   */
  static void clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}
