import 'package:json_annotation/json_annotation.dart';

part 'main_article.g.dart';


@JsonSerializable()
class MainArticle extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<ArticleModel> datas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  MainArticle(this.curPage,this.datas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory MainArticle.fromJson(Map<String, dynamic> srcJson) => _$MainArticleFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MainArticleToJson(this);

  @override
  String toString() {
    return 'MainArticle{curPage: $curPage, datas: $datas, offset: $offset, over: $over, pageCount: $pageCount, size: $size, total: $total}';
  }


}
@JsonSerializable()
class ArticleModel extends Object {

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'audit')
  int audit;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'niceShareDate')
  String niceShareDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'selfVisible')
  int selfVisible;

  @JsonKey(name: 'shareDate')
  int shareDate;

  @JsonKey(name: 'shareUser')
  String shareUser;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  ArticleModel(this.apkLink,this.audit,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory ArticleModel.fromJson(Map<String, dynamic> srcJson) => _$ArticleModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  @override
  String toString() {
    return 'ArticleModel{apkLink: $apkLink, audit: $audit, author: $author, chapterId: $chapterId, chapterName: $chapterName, collect: $collect, courseId: $courseId, desc: $desc, envelopePic: $envelopePic, fresh: $fresh, id: $id, link: $link, niceDate: $niceDate, niceShareDate: $niceShareDate, origin: $origin, prefix: $prefix, projectLink: $projectLink, publishTime: $publishTime, selfVisible: $selfVisible, shareDate: $shareDate, shareUser: $shareUser, superChapterId: $superChapterId, superChapterName: $superChapterName, tags: $tags, title: $title, type: $type, userId: $userId, visible: $visible, zan: $zan}';
  }

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}

//@JsonSerializable()
//class Datas extends Object {
//
//  @JsonKey(name: 'apkLink')
//  String apkLink;
//
//  @JsonKey(name: 'audit')
//  int audit;
//
//  @JsonKey(name: 'author')
//  String author;
//
//  @JsonKey(name: 'canEdit')
//  bool canEdit;
//
//  @JsonKey(name: 'chapterId')
//  int chapterId;
//
//  @JsonKey(name: 'chapterName')
//  String chapterName;
//
//  @JsonKey(name: 'collect')
//  bool collect;
//
//  @JsonKey(name: 'courseId')
//  int courseId;
//
//  @JsonKey(name: 'desc')
//  String desc;
//
//  @JsonKey(name: 'descMd')
//  String descMd;
//
//  @JsonKey(name: 'envelopePic')
//  String envelopePic;
//
//  @JsonKey(name: 'fresh')
//  bool fresh;
//
//  @JsonKey(name: 'id')
//  int id;
//
//  @JsonKey(name: 'link')
//  String link;
//
//  @JsonKey(name: 'niceDate')
//  String niceDate;
//
//  @JsonKey(name: 'niceShareDate')
//  String niceShareDate;
//
//  @JsonKey(name: 'origin')
//  String origin;
//
//  @JsonKey(name: 'prefix')
//  String prefix;
//
//  @JsonKey(name: 'projectLink')
//  String projectLink;
//
//  @JsonKey(name: 'publishTime')
//  int publishTime;
//
//  @JsonKey(name: 'selfVisible')
//  int selfVisible;
//
//  @JsonKey(name: 'shareDate')
//  int shareDate;
//
//  @JsonKey(name: 'shareUser')
//  String shareUser;
//
//  @JsonKey(name: 'superChapterId')
//  int superChapterId;
//
//  @JsonKey(name: 'superChapterName')
//  String superChapterName;
//
//  @JsonKey(name: 'tags')
//  List<dynamic> tags;
//
//  @JsonKey(name: 'title')
//  String title;
//
//  @JsonKey(name: 'type')
//  int type;
//
//  @JsonKey(name: 'userId')
//  int userId;
//
//  @JsonKey(name: 'visible')
//  int visible;
//
//  @JsonKey(name: 'zan')
//  int zan;
//
//  Datas(this.apkLink,this.audit,this.author,this.canEdit,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.descMd,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.selfVisible,this.shareDate,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);
//
//  factory Datas.fromJson(Map<String, dynamic> srcJson) => _$DatasFromJson(srcJson);
//
//  Map<String, dynamic> toJson() => _$DatasToJson(this);
//
//}
