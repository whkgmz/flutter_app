import 'dart:collection';

import 'package:dio/dio.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options) async {
    bool refresh = options.extra['refresh'] == true;

    if (refresh) {
      if (options.extra["list"] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        _delete(options.uri.toString());
      }
      return options;
    }
    if (options.extra["noCache"] == true &&
        options.method.toLowerCase() == "get") {
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        if (DateTime.now().millisecondsSinceEpoch - ob.timeStamp / 1000 <
            1000) {
          return ob.response;
        } else {
          cache.remove(key);
        }
      }
    }
  }

  @override
  onError(DioError err) async {}

  @override
  onResponse(Response response) async {
    await _saveCache(response);
  }

  _saveCache(Response response) async {
    RequestOptions options = response.request;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      if (cache.length == 100) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }

  void _delete(String key) {
    cache.remove(key);
  }
}
