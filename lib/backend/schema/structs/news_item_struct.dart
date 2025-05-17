// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NewsItemStruct extends FFFirebaseStruct {
  NewsItemStruct({
    String? title,
    DateTime? pubDate,
    String? link,
    String? description,
    String? author,
    String? content,
    String? thumbnail,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _pubDate = pubDate,
        _link = link,
        _description = description,
        _author = author,
        _content = content,
        _thumbnail = thumbnail,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "pubDate" field.
  DateTime? _pubDate;
  DateTime? get pubDate => _pubDate;
  set pubDate(DateTime? val) => _pubDate = val;

  bool hasPubDate() => _pubDate != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;

  bool hasLink() => _link != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;

  bool hasAuthor() => _author != null;

  // "content" field.
  String? _content;
  String get content => _content ?? '';
  set content(String? val) => _content = val;

  bool hasContent() => _content != null;

  // "thumbnail" field.
  String? _thumbnail;
  String get thumbnail => _thumbnail ?? '';
  set thumbnail(String? val) => _thumbnail = val;

  bool hasThumbnail() => _thumbnail != null;

  static NewsItemStruct fromMap(Map<String, dynamic> data) => NewsItemStruct(
        title: data['title'] as String?,
        pubDate: data['pubDate'] as DateTime?,
        link: data['link'] as String?,
        description: data['description'] as String?,
        author: data['author'] as String?,
        content: data['content'] as String?,
        thumbnail: data['thumbnail'] as String?,
      );

  static NewsItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? NewsItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'pubDate': _pubDate,
        'link': _link,
        'description': _description,
        'author': _author,
        'content': _content,
        'thumbnail': _thumbnail,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'pubDate': serializeParam(
          _pubDate,
          ParamType.DateTime,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'content': serializeParam(
          _content,
          ParamType.String,
        ),
        'thumbnail': serializeParam(
          _thumbnail,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewsItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      NewsItemStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        pubDate: deserializeParam(
          data['pubDate'],
          ParamType.DateTime,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        content: deserializeParam(
          data['content'],
          ParamType.String,
          false,
        ),
        thumbnail: deserializeParam(
          data['thumbnail'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewsItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewsItemStruct &&
        title == other.title &&
        pubDate == other.pubDate &&
        link == other.link &&
        description == other.description &&
        author == other.author &&
        content == other.content &&
        thumbnail == other.thumbnail;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, pubDate, link, description, author, content, thumbnail]);
}

NewsItemStruct createNewsItemStruct({
  String? title,
  DateTime? pubDate,
  String? link,
  String? description,
  String? author,
  String? content,
  String? thumbnail,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewsItemStruct(
      title: title,
      pubDate: pubDate,
      link: link,
      description: description,
      author: author,
      content: content,
      thumbnail: thumbnail,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewsItemStruct? updateNewsItemStruct(
  NewsItemStruct? newsItem, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newsItem
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewsItemStructData(
  Map<String, dynamic> firestoreData,
  NewsItemStruct? newsItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newsItem == null) {
    return;
  }
  if (newsItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newsItem.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newsItemData = getNewsItemFirestoreData(newsItem, forFieldValue);
  final nestedData = newsItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = newsItem.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewsItemFirestoreData(
  NewsItemStruct? newsItem, [
  bool forFieldValue = false,
]) {
  if (newsItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newsItem.toMap());

  // Add any Firestore field values
  newsItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewsItemListFirestoreData(
  List<NewsItemStruct>? newsItems,
) =>
    newsItems?.map((e) => getNewsItemFirestoreData(e, true)).toList() ?? [];
