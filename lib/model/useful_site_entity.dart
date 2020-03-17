import 'package:json_annotation/json_annotation.dart';

part 'useful_site_entity.g.dart';


@JsonSerializable()
class UsefulSiteEntity extends Object {

	@JsonKey(name: 'icon')
	String icon;

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

	UsefulSiteEntity(this.icon,this.id,this.link,this.name,this.order,this.visible,);

	factory UsefulSiteEntity.fromJson(Map<String, dynamic> srcJson) => _$UsefulSiteEntityFromJson(srcJson);

	Map<String, dynamic> toJson() => _$UsefulSiteEntityToJson(this);

}


