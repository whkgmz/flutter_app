// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'useful_site_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsefulSiteEntity _$UsefulSiteEntityFromJson(Map<String, dynamic> json) {
  return UsefulSiteEntity(
    json['icon'] as String,
    json['id'] as int,
    json['link'] as String,
    json['name'] as String,
    json['order'] as int,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$UsefulSiteEntityToJson(UsefulSiteEntity instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
