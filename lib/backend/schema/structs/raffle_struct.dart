// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RaffleStruct extends FFFirebaseStruct {
  RaffleStruct({
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    String? description,
    String? artWorkImg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _startTime = startTime,
        _endTime = endTime,
        _description = description,
        _artWorkImg = artWorkImg,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "StartTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;

  bool hasStartTime() => _startTime != null;

  // "EndTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;

  bool hasEndTime() => _endTime != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "ArtWork_Img" field.
  String? _artWorkImg;
  String get artWorkImg => _artWorkImg ?? '';
  set artWorkImg(String? val) => _artWorkImg = val;

  bool hasArtWorkImg() => _artWorkImg != null;

  static RaffleStruct fromMap(Map<String, dynamic> data) => RaffleStruct(
        title: data['Title'] as String?,
        startTime: data['StartTime'] as DateTime?,
        endTime: data['EndTime'] as DateTime?,
        description: data['Description'] as String?,
        artWorkImg: data['ArtWork_Img'] as String?,
      );

  static RaffleStruct? maybeFromMap(dynamic data) =>
      data is Map ? RaffleStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'StartTime': _startTime,
        'EndTime': _endTime,
        'Description': _description,
        'ArtWork_Img': _artWorkImg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'StartTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'EndTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'Description': serializeParam(
          _description,
          ParamType.String,
        ),
        'ArtWork_Img': serializeParam(
          _artWorkImg,
          ParamType.String,
        ),
      }.withoutNulls;

  static RaffleStruct fromSerializableMap(Map<String, dynamic> data) =>
      RaffleStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['StartTime'],
          ParamType.DateTime,
          false,
        ),
        endTime: deserializeParam(
          data['EndTime'],
          ParamType.DateTime,
          false,
        ),
        description: deserializeParam(
          data['Description'],
          ParamType.String,
          false,
        ),
        artWorkImg: deserializeParam(
          data['ArtWork_Img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RaffleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RaffleStruct &&
        title == other.title &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        description == other.description &&
        artWorkImg == other.artWorkImg;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, startTime, endTime, description, artWorkImg]);
}

RaffleStruct createRaffleStruct({
  String? title,
  DateTime? startTime,
  DateTime? endTime,
  String? description,
  String? artWorkImg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RaffleStruct(
      title: title,
      startTime: startTime,
      endTime: endTime,
      description: description,
      artWorkImg: artWorkImg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RaffleStruct? updateRaffleStruct(
  RaffleStruct? raffle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    raffle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRaffleStructData(
  Map<String, dynamic> firestoreData,
  RaffleStruct? raffle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (raffle == null) {
    return;
  }
  if (raffle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && raffle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final raffleData = getRaffleFirestoreData(raffle, forFieldValue);
  final nestedData = raffleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = raffle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRaffleFirestoreData(
  RaffleStruct? raffle, [
  bool forFieldValue = false,
]) {
  if (raffle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(raffle.toMap());

  // Add any Firestore field values
  raffle.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRaffleListFirestoreData(
  List<RaffleStruct>? raffles,
) =>
    raffles?.map((e) => getRaffleFirestoreData(e, true)).toList() ?? [];
