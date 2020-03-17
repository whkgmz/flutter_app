// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hot_keys.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotKeys _$HotKeysFromJson(Map<String, dynamic> json) {
  return HotKeys(
    json['id'] as int,
    json['link'] as String,
    json['name'] as String,
    json['order'] as int,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$HotKeysToJson(HotKeys instance) => <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
