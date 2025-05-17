import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ArtworkTradeTestRecord extends FirestoreRecord {
  ArtworkTradeTestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "owned_id" field.
  DocumentReference? _ownedId;
  DocumentReference? get ownedId => _ownedId;
  bool hasOwnedId() => _ownedId != null;

  // "image_path" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "creator_id" field.
  DocumentReference? _creatorId;
  DocumentReference? get creatorId => _creatorId;
  bool hasCreatorId() => _creatorId != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _ownedId = snapshotData['owned_id'] as DocumentReference?;
    _imagePath = snapshotData['image_path'] as String?;
    _description = snapshotData['description'] as String?;
    _creatorId = snapshotData['creator_id'] as DocumentReference?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('artwork_trade_test');

  static Stream<ArtworkTradeTestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ArtworkTradeTestRecord.fromSnapshot(s));

  static Future<ArtworkTradeTestRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ArtworkTradeTestRecord.fromSnapshot(s));

  static ArtworkTradeTestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ArtworkTradeTestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ArtworkTradeTestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ArtworkTradeTestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ArtworkTradeTestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ArtworkTradeTestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createArtworkTradeTestRecordData({
  String? title,
  DocumentReference? ownedId,
  String? imagePath,
  String? description,
  DocumentReference? creatorId,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'owned_id': ownedId,
      'image_path': imagePath,
      'description': description,
      'creator_id': creatorId,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class ArtworkTradeTestRecordDocumentEquality
    implements Equality<ArtworkTradeTestRecord> {
  const ArtworkTradeTestRecordDocumentEquality();

  @override
  bool equals(ArtworkTradeTestRecord? e1, ArtworkTradeTestRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.ownedId == e2?.ownedId &&
        e1?.imagePath == e2?.imagePath &&
        e1?.description == e2?.description &&
        e1?.creatorId == e2?.creatorId &&
        e1?.price == e2?.price;
  }

  @override
  int hash(ArtworkTradeTestRecord? e) => const ListEquality().hash([
        e?.title,
        e?.ownedId,
        e?.imagePath,
        e?.description,
        e?.creatorId,
        e?.price
      ]);

  @override
  bool isValidKey(Object? o) => o is ArtworkTradeTestRecord;
}
