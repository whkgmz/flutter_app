import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';


@JsonSerializable()
class BannerModel extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  BannerModel(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory BannerModel.fromJson(Map<String, dynamic> srcJson) => _$BannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);

  @override
  String toString() {
    return 'BannerModel{desc: $desc, id: $id, imagePath: $imagePath, isVisible: $isVisible, order: $order, title: $title, type: $type, url: $url}';
  }


}


