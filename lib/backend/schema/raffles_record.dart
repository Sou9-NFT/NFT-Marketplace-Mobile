import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RafflesRecord extends FirestoreRecord {
  RafflesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "StartTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "ArtWork_img" field.
  String? _artWorkImg;
  String get artWorkImg => _artWorkImg ?? '';
  bool hasArtWorkImg() => _artWorkImg != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "EndTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "participants" field.
  List<String>? _participants;
  List<String> get participants => _participants ?? const [];
  bool hasParticipants() => _participants != null;

  // "winnerUID" field.
  String? _winnerUID;
  String get winnerUID => _winnerUID ?? '';
  bool hasWinnerUID() => _winnerUID != null;

  // "ownerUid" field.
  String? _ownerUid;
  String get ownerUid => _ownerUid ?? '';
  bool hasOwnerUid() => _ownerUid != null;

  void _initializeFields() {
    _startTime = snapshotData['StartTime'] as DateTime?;
    _title = snapshotData['Title'] as String?;
    _artWorkImg = snapshotData['ArtWork_img'] as String?;
    _description = snapshotData['Description'] as String?;
    _endTime = snapshotData['EndTime'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _participants = getDataList(snapshotData['participants']);
    _winnerUID = snapshotData['winnerUID'] as String?;
    _ownerUid = snapshotData['ownerUid'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Raffles');

  static Stream<RafflesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RafflesRecord.fromSnapshot(s));

  static Future<RafflesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RafflesRecord.fromSnapshot(s));

  static RafflesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RafflesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RafflesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RafflesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RafflesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RafflesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRafflesRecordData({
  DateTime? startTime,
  String? title,
  String? artWorkImg,
  String? description,
  DateTime? endTime,
  String? status,
  String? winnerUID,
  String? ownerUid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'StartTime': startTime,
      'Title': title,
      'ArtWork_img': artWorkImg,
      'Description': description,
      'EndTime': endTime,
      'status': status,
      'winnerUID': winnerUID,
      'ownerUid': ownerUid,
    }.withoutNulls,
  );

  return firestoreData;
}

class RafflesRecordDocumentEquality implements Equality<RafflesRecord> {
  const RafflesRecordDocumentEquality();

  @override
  bool equals(RafflesRecord? e1, RafflesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.startTime == e2?.startTime &&
        e1?.title == e2?.title &&
        e1?.artWorkImg == e2?.artWorkImg &&
        e1?.description == e2?.description &&
        e1?.endTime == e2?.endTime &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.participants, e2?.participants) &&
        e1?.winnerUID == e2?.winnerUID &&
        e1?.ownerUid == e2?.ownerUid;
  }

  @override
  int hash(RafflesRecord? e) => const ListEquality().hash([
        e?.startTime,
        e?.title,
        e?.artWorkImg,
        e?.description,
        e?.endTime,
        e?.status,
        e?.participants,
        e?.winnerUID,
        e?.ownerUid
      ]);

  @override
  bool isValidKey(Object? o) => o is RafflesRecord;
}
