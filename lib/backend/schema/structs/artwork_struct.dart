// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtworkStruct extends FFFirebaseStruct {
  ArtworkStruct({
    String? image,
    String? title,
    String? ownerId,
    String? creatorId,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _title = title,
        _ownerId = ownerId,
        _creatorId = creatorId,
        _uid = uid,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "ownerId" field.
  String? _ownerId;
  String get ownerId => _ownerId ?? '';
  set ownerId(String? val) => _ownerId = val;

  bool hasOwnerId() => _ownerId != null;

  // "creatorId" field.
  String? _creatorId;
  String get creatorId => _creatorId ?? '';
  set creatorId(String? val) => _creatorId = val;

  bool hasCreatorId() => _creatorId != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  static ArtworkStruct fromMap(Map<String, dynamic> data) => ArtworkStruct(
        image: data['image'] as String?,
        title: data['title'] as String?,
        ownerId: data['ownerId'] as String?,
        creatorId: data['creatorId'] as String?,
        uid: data['uid'] as String?,
      );

  static ArtworkStruct? maybeFromMap(dynamic data) =>
      data is Map ? ArtworkStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'title': _title,
        'ownerId': _ownerId,
        'creatorId': _creatorId,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'ownerId': serializeParam(
          _ownerId,
          ParamType.String,
        ),
        'creatorId': serializeParam(
          _creatorId,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static ArtworkStruct fromSerializableMap(Map<String, dynamic> data) =>
      ArtworkStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        ownerId: deserializeParam(
          data['ownerId'],
          ParamType.String,
          false,
        ),
        creatorId: deserializeParam(
          data['creatorId'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ArtworkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ArtworkStruct &&
        image == other.image &&
        title == other.title &&
        ownerId == other.ownerId &&
        creatorId == other.creatorId &&
        uid == other.uid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([image, title, ownerId, creatorId, uid]);
}

ArtworkStruct createArtworkStruct({
  String? image,
  String? title,
  String? ownerId,
  String? creatorId,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ArtworkStruct(
      image: image,
      title: title,
      ownerId: ownerId,
      creatorId: creatorId,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ArtworkStruct? updateArtworkStruct(
  ArtworkStruct? artwork, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    artwork
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addArtworkStructData(
  Map<String, dynamic> firestoreData,
  ArtworkStruct? artwork,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (artwork == null) {
    return;
  }
  if (artwork.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && artwork.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final artworkData = getArtworkFirestoreData(artwork, forFieldValue);
  final nestedData = artworkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = artwork.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getArtworkFirestoreData(
  ArtworkStruct? artwork, [
  bool forFieldValue = false,
]) {
  if (artwork == null) {
    return {};
  }
  final firestoreData = mapToFirestore(artwork.toMap());

  // Add any Firestore field values
  artwork.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getArtworkListFirestoreData(
  List<ArtworkStruct>? artworks,
) =>
    artworks?.map((e) => getArtworkFirestoreData(e, true)).toList() ?? [];
