import 'package:json_annotation/json_annotation.dart';

part 'hot_keys.g.dart';


@JsonSerializable()
class HotKeys extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'visible')
  int visible;

  HotKeys(this.id,this.link,this.name,this.order,this.visible,);

  factory HotKeys.fromJson(Map<String, dynamic> srcJson) => _$HotKeysFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotKeysToJson(this);

}


