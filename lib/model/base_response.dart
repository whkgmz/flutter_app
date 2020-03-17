class BaseResponse<T> {
  int _errorCode;
  String _errorMsg;
  T _data;

  BaseResponse(T data, int errorCode, String errorMsg)
      : this._data = data,
        this._errorMsg = errorMsg,
        this._errorCode = errorCode;

  int get errorCode => this._errorCode;

  String get errorMsg => this._errorMsg;

  T get data => this._data;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(json['data'], json['errorCode'], json['errorMsg']);
  }
}
