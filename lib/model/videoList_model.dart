class VideoListModel {
  int _retcode;
  String _retdesc;
  Object _object;

  VideoListModel({int retcode, String retdesc, Object object}) {
    this._retcode = retcode;
    this._retdesc = retdesc;
    this._object = object;
  }

  int get retcode => _retcode;
  set retcode(int retcode) => _retcode = retcode;
  String get retdesc => _retdesc;
  set retdesc(String retdesc) => _retdesc = retdesc;
  Object get object => _object;
  set object(Object object) => _object = object;

  VideoListModel.fromJson(Map<String, dynamic> json) {
    _retcode = json['retcode'];
    _retdesc = json['retdesc'];
    _object =
        json['object'] != null ? new Object.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['retcode'] = this._retcode;
    data['retdesc'] = this._retdesc;
    if (this._object != null) {
      data['object'] = this._object.toJson();
    }
    return data;
  }
}

class Object {
  List<SportList> _sportList;
  int _totalSport;
  int _totalSecond;
  int _movementType12;
  int _trainPlanGenStatus;
  VideoPlayStatus _videoPlayStatus;
  String _displayName;
  String _displayDesc;
  String _athleticAbilityLevel;
  String _athleticAbilityLevelName;
  String _classEffect;
  String _classInfluence;

  Object(
      {List<SportList> sportList,
      int totalSport,
      int totalSecond,
      int movementType12,
      int trainPlanGenStatus,
      VideoPlayStatus videoPlayStatus,
      String displayName,
      String displayDesc,
      String athleticAbilityLevel,
      String athleticAbilityLevelName,
      String classEffect,
      String classInfluence}) {
    this._sportList = sportList;
    this._totalSport = totalSport;
    this._totalSecond = totalSecond;
    this._movementType12 = movementType12;
    this._trainPlanGenStatus = trainPlanGenStatus;
    this._videoPlayStatus = videoPlayStatus;
    this._displayName = displayName;
    this._displayDesc = displayDesc;
    this._athleticAbilityLevel = athleticAbilityLevel;
    this._athleticAbilityLevelName = athleticAbilityLevelName;
    this._classEffect = classEffect;
    this._classInfluence = classInfluence;
  }

  List<SportList> get sportList => _sportList;
  set sportList(List<SportList> sportList) => _sportList = sportList;
  int get totalSport => _totalSport;
  set totalSport(int totalSport) => _totalSport = totalSport;
  int get totalSecond => _totalSecond;
  set totalSecond(int totalSecond) => _totalSecond = totalSecond;
  int get movementType12 => _movementType12;
  set movementType12(int movementType12) => _movementType12 = movementType12;
  int get trainPlanGenStatus => _trainPlanGenStatus;
  set trainPlanGenStatus(int trainPlanGenStatus) =>
      _trainPlanGenStatus = trainPlanGenStatus;
  VideoPlayStatus get videoPlayStatus => _videoPlayStatus;
  set videoPlayStatus(VideoPlayStatus videoPlayStatus) =>
      _videoPlayStatus = videoPlayStatus;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;
  String get displayDesc => _displayDesc;
  set displayDesc(String displayDesc) => _displayDesc = displayDesc;
  String get athleticAbilityLevel => _athleticAbilityLevel;
  set athleticAbilityLevel(String athleticAbilityLevel) =>
      _athleticAbilityLevel = athleticAbilityLevel;
  String get athleticAbilityLevelName => _athleticAbilityLevelName;
  set athleticAbilityLevelName(String athleticAbilityLevelName) =>
      _athleticAbilityLevelName = athleticAbilityLevelName;
  String get classEffect => _classEffect;
  set classEffect(String classEffect) => _classEffect = classEffect;
  String get classInfluence => _classInfluence;
  set classInfluence(String classInfluence) => _classInfluence = classInfluence;

  Object.fromJson(Map<String, dynamic> json) {
    if (json['sportList'] != null) {
      _sportList = new List<SportList>();
      json['sportList'].forEach((v) {
        _sportList.add(new SportList.fromJson(v));
      });
    }
    _totalSport = json['totalSport'];
    _totalSecond = json['totalSecond'];
    _movementType12 = json['movementType12'];
    _trainPlanGenStatus = json['trainPlanGenStatus'];
    _videoPlayStatus = json['videoPlayStatus'] != null
        ? new VideoPlayStatus.fromJson(json['videoPlayStatus'])
        : null;
    _displayName = json['displayName'];
    _displayDesc = json['displayDesc'];
    _athleticAbilityLevel = json['athleticAbilityLevel'];
    _athleticAbilityLevelName = json['athleticAbilityLevelName'];
    _classEffect = json['classEffect'];
    _classInfluence = json['classInfluence'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._sportList != null) {
      data['sportList'] = this._sportList.map((v) => v.toJson()).toList();
    }
    data['totalSport'] = this._totalSport;
    data['totalSecond'] = this._totalSecond;
    data['movementType12'] = this._movementType12;
    data['trainPlanGenStatus'] = this._trainPlanGenStatus;
    if (this._videoPlayStatus != null) {
      data['videoPlayStatus'] = this._videoPlayStatus.toJson();
    }
    data['displayName'] = this._displayName;
    data['displayDesc'] = this._displayDesc;
    data['athleticAbilityLevel'] = this._athleticAbilityLevel;
    data['athleticAbilityLevelName'] = this._athleticAbilityLevelName;
    data['classEffect'] = this._classEffect;
    data['classInfluence'] = this._classInfluence;
    return data;
  }
}

class SportList {
  int _sportId;
  String _sportName;
  int _videoType;
  int _movementType;
  int _body;
  int _bodyPosition;
  int _difficulty;
  int _isUserShow;
  int _stationary;
  String _theme;
  double _met;
  double _metHighest;
  String _displayName;
  int _displayUnit;
  int _displayNum;
  String _imageUrl;
  String _videoUrl;
  String _followVideo1Url;
  String _followVideo2Url;
  String _followVideo3Url;
  String _followVideo4Url;
  String _followVideo5Url;
  String _followVideo6Url;
  int _playback;
  int _repetitionPause;
  int _muscle;
  int _side;
  int _environment;
  String _equipement;
  int _model;
  String _sportDesc;
  String _frequentFault;
  String _remark;
  int _createTime;
  int _createUserId;
  int _isDelete;
  int _lastUpdateTime;
  int _lastUpdateUserId;
  List<FloorAndDockVideo> _floorAndDockVideo;
  int _repetition;
  int _applyId;
  Null _userId;
  Null _campType;
  int _sportPlanId;
  int _sportTypeId;
  int _planDate;

  SportList(
      {int sportId,
      String sportName,
      int videoType,
      int movementType,
      int body,
      int bodyPosition,
      int difficulty,
      int isUserShow,
      int stationary,
      String theme,
      double met,
      double metHighest,
      String displayName,
      int displayUnit,
      int displayNum,
      String imageUrl,
      String videoUrl,
      String followVideo1Url,
      String followVideo2Url,
      String followVideo3Url,
      String followVideo4Url,
      String followVideo5Url,
      String followVideo6Url,
      int playback,
      int repetitionPause,
      int muscle,
      int side,
      int environment,
      String equipement,
      int model,
      String sportDesc,
      String frequentFault,
      String remark,
      int createTime,
      int createUserId,
      int isDelete,
      int lastUpdateTime,
      int lastUpdateUserId,
      List<FloorAndDockVideo> floorAndDockVideo,
      int repetition,
      int applyId,
      Null userId,
      Null campType,
      int sportPlanId,
      int sportTypeId,
      int planDate}) {
    this._sportId = sportId;
    this._sportName = sportName;
    this._videoType = videoType;
    this._movementType = movementType;
    this._body = body;
    this._bodyPosition = bodyPosition;
    this._difficulty = difficulty;
    this._isUserShow = isUserShow;
    this._stationary = stationary;
    this._theme = theme;
    this._met = met;
    this._metHighest = metHighest;
    this._displayName = displayName;
    this._displayUnit = displayUnit;
    this._displayNum = displayNum;
    this._imageUrl = imageUrl;
    this._videoUrl = videoUrl;
    this._followVideo1Url = followVideo1Url;
    this._followVideo2Url = followVideo2Url;
    this._followVideo3Url = followVideo3Url;
    this._followVideo4Url = followVideo4Url;
    this._followVideo5Url = followVideo5Url;
    this._followVideo6Url = followVideo6Url;
    this._playback = playback;
    this._repetitionPause = repetitionPause;
    this._muscle = muscle;
    this._side = side;
    this._environment = environment;
    this._equipement = equipement;
    this._model = model;
    this._sportDesc = sportDesc;
    this._frequentFault = frequentFault;
    this._remark = remark;
    this._createTime = createTime;
    this._createUserId = createUserId;
    this._isDelete = isDelete;
    this._lastUpdateTime = lastUpdateTime;
    this._lastUpdateUserId = lastUpdateUserId;
    this._floorAndDockVideo = floorAndDockVideo;
    this._repetition = repetition;
    this._applyId = applyId;
    this._userId = userId;
    this._campType = campType;
    this._sportPlanId = sportPlanId;
    this._sportTypeId = sportTypeId;
    this._planDate = planDate;
  }

  int get sportId => _sportId;
  set sportId(int sportId) => _sportId = sportId;
  String get sportName => _sportName;
  set sportName(String sportName) => _sportName = sportName;
  int get videoType => _videoType;
  set videoType(int videoType) => _videoType = videoType;
  int get movementType => _movementType;
  set movementType(int movementType) => _movementType = movementType;
  int get body => _body;
  set body(int body) => _body = body;
  int get bodyPosition => _bodyPosition;
  set bodyPosition(int bodyPosition) => _bodyPosition = bodyPosition;
  int get difficulty => _difficulty;
  set difficulty(int difficulty) => _difficulty = difficulty;
  int get isUserShow => _isUserShow;
  set isUserShow(int isUserShow) => _isUserShow = isUserShow;
  int get stationary => _stationary;
  set stationary(int stationary) => _stationary = stationary;
  String get theme => _theme;
  set theme(String theme) => _theme = theme;
  double get met => _met;
  set met(double met) => _met = met;
  double get metHighest => _metHighest;
  set metHighest(double metHighest) => _metHighest = metHighest;
  String get displayName => _displayName;
  set displayName(String displayName) => _displayName = displayName;
  int get displayUnit => _displayUnit;
  set displayUnit(int displayUnit) => _displayUnit = displayUnit;
  int get displayNum => _displayNum;
  set displayNum(int displayNum) => _displayNum = displayNum;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  String get videoUrl => _videoUrl;
  set videoUrl(String videoUrl) => _videoUrl = videoUrl;
  String get followVideo1Url => _followVideo1Url;
  set followVideo1Url(String followVideo1Url) =>
      _followVideo1Url = followVideo1Url;
  String get followVideo2Url => _followVideo2Url;
  set followVideo2Url(String followVideo2Url) =>
      _followVideo2Url = followVideo2Url;
  String get followVideo3Url => _followVideo3Url;
  set followVideo3Url(String followVideo3Url) =>
      _followVideo3Url = followVideo3Url;
  String get followVideo4Url => _followVideo4Url;
  set followVideo4Url(String followVideo4Url) =>
      _followVideo4Url = followVideo4Url;
  String get followVideo5Url => _followVideo5Url;
  set followVideo5Url(String followVideo5Url) =>
      _followVideo5Url = followVideo5Url;
  String get followVideo6Url => _followVideo6Url;
  set followVideo6Url(String followVideo6Url) =>
      _followVideo6Url = followVideo6Url;
  int get playback => _playback;
  set playback(int playback) => _playback = playback;
  int get repetitionPause => _repetitionPause;
  set repetitionPause(int repetitionPause) =>
      _repetitionPause = repetitionPause;
  int get muscle => _muscle;
  set muscle(int muscle) => _muscle = muscle;
  int get side => _side;
  set side(int side) => _side = side;
  int get environment => _environment;
  set environment(int environment) => _environment = environment;
  String get equipement => _equipement;
  set equipement(String equipement) => _equipement = equipement;
  int get model => _model;
  set model(int model) => _model = model;
  String get sportDesc => _sportDesc;
  set sportDesc(String sportDesc) => _sportDesc = sportDesc;
  String get frequentFault => _frequentFault;
  set frequentFault(String frequentFault) => _frequentFault = frequentFault;
  String get remark => _remark;
  set remark(String remark) => _remark = remark;
  int get createTime => _createTime;
  set createTime(int createTime) => _createTime = createTime;
  int get createUserId => _createUserId;
  set createUserId(int createUserId) => _createUserId = createUserId;
  int get isDelete => _isDelete;
  set isDelete(int isDelete) => _isDelete = isDelete;
  int get lastUpdateTime => _lastUpdateTime;
  set lastUpdateTime(int lastUpdateTime) => _lastUpdateTime = lastUpdateTime;
  int get lastUpdateUserId => _lastUpdateUserId;
  set lastUpdateUserId(int lastUpdateUserId) =>
      _lastUpdateUserId = lastUpdateUserId;
  List<FloorAndDockVideo> get floorAndDockVideo => _floorAndDockVideo;
  set floorAndDockVideo(List<FloorAndDockVideo> floorAndDockVideo) =>
      _floorAndDockVideo = floorAndDockVideo;
  int get repetition => _repetition;
  set repetition(int repetition) => _repetition = repetition;
  int get applyId => _applyId;
  set applyId(int applyId) => _applyId = applyId;
  Null get userId => _userId;
  set userId(Null userId) => _userId = userId;
  Null get campType => _campType;
  set campType(Null campType) => _campType = campType;
  int get sportPlanId => _sportPlanId;
  set sportPlanId(int sportPlanId) => _sportPlanId = sportPlanId;
  int get sportTypeId => _sportTypeId;
  set sportTypeId(int sportTypeId) => _sportTypeId = sportTypeId;
  int get planDate => _planDate;
  set planDate(int planDate) => _planDate = planDate;

  SportList.fromJson(Map<String, dynamic> json) {
    _sportId = json['sportId'];
    _sportName = json['sportName'];
    _videoType = json['videoType'];
    _movementType = json['movementType'];
    _body = json['body'];
    _bodyPosition = json['bodyPosition'];
    _difficulty = json['difficulty'];
    _isUserShow = json['isUserShow'];
    _stationary = json['stationary'];
    _theme = json['theme'];
    _met = json['met'];
    _metHighest = json['metHighest'];
    _displayName = json['displayName'];
    _displayUnit = json['displayUnit'];
    _displayNum = json['displayNum'];
    _imageUrl = json['imageUrl'];
    _videoUrl = json['videoUrl'];
    _followVideo1Url = json['followVideo1Url'];
    _followVideo2Url = json['followVideo2Url'];
    _followVideo3Url = json['followVideo3Url'];
    _followVideo4Url = json['followVideo4Url'];
    _followVideo5Url = json['followVideo5Url'];
    _followVideo6Url = json['followVideo6Url'];
    _playback = json['playback'];
    _repetitionPause = json['repetitionPause'];
    _muscle = json['muscle'];
    _side = json['side'];
    _environment = json['environment'];
    _equipement = json['equipement'];
    _model = json['model'];
    _sportDesc = json['sportDesc'];
    _frequentFault = json['frequentFault'];
    _remark = json['remark'];
    _createTime = json['createTime'];
    _createUserId = json['createUserId'];
    _isDelete = json['isDelete'];
    _lastUpdateTime = json['lastUpdateTime'];
    _lastUpdateUserId = json['lastUpdateUserId'];
    if (json['floorAndDockVideo'] != null) {
      _floorAndDockVideo = new List<FloorAndDockVideo>();
      json['floorAndDockVideo'].forEach((v) {
        _floorAndDockVideo.add(new FloorAndDockVideo.fromJson(v));
      });
    }
    _repetition = json['repetition'];
    _applyId = json['applyId'];
    _userId = json['userId'];
    _campType = json['campType'];
    _sportPlanId = json['sportPlanId'];
    _sportTypeId = json['sportTypeId'];
    _planDate = json['planDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sportId'] = this._sportId;
    data['sportName'] = this._sportName;
    data['videoType'] = this._videoType;
    data['movementType'] = this._movementType;
    data['body'] = this._body;
    data['bodyPosition'] = this._bodyPosition;
    data['difficulty'] = this._difficulty;
    data['isUserShow'] = this._isUserShow;
    data['stationary'] = this._stationary;
    data['theme'] = this._theme;
    data['met'] = this._met;
    data['metHighest'] = this._metHighest;
    data['displayName'] = this._displayName;
    data['displayUnit'] = this._displayUnit;
    data['displayNum'] = this._displayNum;
    data['imageUrl'] = this._imageUrl;
    data['videoUrl'] = this._videoUrl;
    data['followVideo1Url'] = this._followVideo1Url;
    data['followVideo2Url'] = this._followVideo2Url;
    data['followVideo3Url'] = this._followVideo3Url;
    data['followVideo4Url'] = this._followVideo4Url;
    data['followVideo5Url'] = this._followVideo5Url;
    data['followVideo6Url'] = this._followVideo6Url;
    data['playback'] = this._playback;
    data['repetitionPause'] = this._repetitionPause;
    data['muscle'] = this._muscle;
    data['side'] = this._side;
    data['environment'] = this._environment;
    data['equipement'] = this._equipement;
    data['model'] = this._model;
    data['sportDesc'] = this._sportDesc;
    data['frequentFault'] = this._frequentFault;
    data['remark'] = this._remark;
    data['createTime'] = this._createTime;
    data['createUserId'] = this._createUserId;
    data['isDelete'] = this._isDelete;
    data['lastUpdateTime'] = this._lastUpdateTime;
    data['lastUpdateUserId'] = this._lastUpdateUserId;
    if (this._floorAndDockVideo != null) {
      data['floorAndDockVideo'] =
          this._floorAndDockVideo.map((v) => v.toJson()).toList();
    }
    data['repetition'] = this._repetition;
    data['applyId'] = this._applyId;
    data['userId'] = this._userId;
    data['campType'] = this._campType;
    data['sportPlanId'] = this._sportPlanId;
    data['sportTypeId'] = this._sportTypeId;
    data['planDate'] = this._planDate;
    return data;
  }
}

class FloorAndDockVideo {
  int _type;
  String _url;

  FloorAndDockVideo({int type, String url}) {
    this._type = type;
    this._url = url;
  }

  int get type => _type;
  set type(int type) => _type = type;
  String get url => _url;
  set url(String url) => _url = url;

  FloorAndDockVideo.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this._type;
    data['url'] = this._url;
    return data;
  }
}

class VideoPlayStatus {
  int _videoPlayType;
  int _movementPlayIndex;
  int _videoPlayIndex;

  VideoPlayStatus(
      {int videoPlayType, int movementPlayIndex, int videoPlayIndex}) {
    this._videoPlayType = videoPlayType;
    this._movementPlayIndex = movementPlayIndex;
    this._videoPlayIndex = videoPlayIndex;
  }

  int get videoPlayType => _videoPlayType;
  set videoPlayType(int videoPlayType) => _videoPlayType = videoPlayType;
  int get movementPlayIndex => _movementPlayIndex;
  set movementPlayIndex(int movementPlayIndex) =>
      _movementPlayIndex = movementPlayIndex;
  int get videoPlayIndex => _videoPlayIndex;
  set videoPlayIndex(int videoPlayIndex) => _videoPlayIndex = videoPlayIndex;

  VideoPlayStatus.fromJson(Map<String, dynamic> json) {
    _videoPlayType = json['videoPlayType'];
    _movementPlayIndex = json['movementPlayIndex'];
    _videoPlayIndex = json['videoPlayIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['videoPlayType'] = this._videoPlayType;
    data['movementPlayIndex'] = this._movementPlayIndex;
    data['videoPlayIndex'] = this._videoPlayIndex;
    return data;
  }
}
