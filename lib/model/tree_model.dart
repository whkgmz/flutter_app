import 'package:json_annotation/json_annotation.dart';

part 'tree_model.g.dart';


@JsonSerializable()
class TreeModel extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  TreeModel(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory TreeModel.fromJson(Map<String, dynamic> srcJson) => _$TreeModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreeModelToJson(this);

  @override
  String toString() {
    return 'TreeModel{children: $children, courseId: $courseId, id: $id, name: $name, order: $order, parentChapterId: $parentChapterId, userControlSetTop: $userControlSetTop, visible: $visible}';
  }


}