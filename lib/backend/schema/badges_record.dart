import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BadgesRecord extends FirestoreRecord {
  BadgesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon_path" field.
  String? _iconPath;
  String get iconPath => _iconPath ?? '';
  bool hasIconPath() => _iconPath != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "badge_id" field.
  int? _badgeId;
  int get badgeId => _badgeId ?? 0;
  bool hasBadgeId() => _badgeId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _iconPath = snapshotData['icon_path'] as String?;
    _description = snapshotData['description'] as String?;
    _badgeId = castToType<int>(snapshotData['badge_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Badges');

  static Stream<BadgesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BadgesRecord.fromSnapshot(s));

  static Future<BadgesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BadgesRecord.fromSnapshot(s));

  static BadgesRecord fromSnapshot(DocumentSnapshot snapshot) => BadgesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BadgesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BadgesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BadgesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BadgesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBadgesRecordData({
  String? name,
  String? iconPath,
  String? description,
  int? badgeId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon_path': iconPath,
      'description': description,
      'badge_id': badgeId,
    }.withoutNulls,
  );

  return firestoreData;
}

class BadgesRecordDocumentEquality implements Equality<BadgesRecord> {
  const BadgesRecordDocumentEquality();

  @override
  bool equals(BadgesRecord? e1, BadgesRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.iconPath == e2?.iconPath &&
        e1?.description == e2?.description &&
        e1?.badgeId == e2?.badgeId;
  }

  @override
  int hash(BadgesRecord? e) => const ListEquality()
      .hash([e?.name, e?.iconPath, e?.description, e?.badgeId]);

  @override
  bool isValidKey(Object? o) => o is BadgesRecord;
}
