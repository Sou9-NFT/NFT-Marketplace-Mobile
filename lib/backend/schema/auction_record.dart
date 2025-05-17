import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuctionRecord extends FirestoreRecord {
  AuctionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "end_date" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "initial_price" field.
  double? _initialPrice;
  double get initialPrice => _initialPrice ?? 0.0;
  bool hasInitialPrice() => _initialPrice != null;

  // "current_price" field.
  double? _currentPrice;
  double get currentPrice => _currentPrice ?? 0.0;
  bool hasCurrentPrice() => _currentPrice != null;

  // "bids" field.
  List<BidStruct>? _bids;
  List<BidStruct> get bids => _bids ?? const [];
  bool hasBids() => _bids != null;

  // "status" field.
  Status? _status;
  Status? get status => _status;
  bool hasStatus() => _status != null;

  // "ownerId" field.
  DocumentReference? _ownerId;
  DocumentReference? get ownerId => _ownerId;
  bool hasOwnerId() => _ownerId != null;

  // "artwork" field.
  DocumentReference? _artwork;
  DocumentReference? get artwork => _artwork;
  bool hasArtwork() => _artwork != null;

  void _initializeFields() {
    _startDate = snapshotData['start_date'] as DateTime?;
    _endDate = snapshotData['end_date'] as DateTime?;
    _initialPrice = castToType<double>(snapshotData['initial_price']);
    _currentPrice = castToType<double>(snapshotData['current_price']);
    _bids = getStructList(
      snapshotData['bids'],
      BidStruct.fromMap,
    );
    _status = snapshotData['status'] is Status
        ? snapshotData['status']
        : deserializeEnum<Status>(snapshotData['status']);
    _ownerId = snapshotData['ownerId'] as DocumentReference?;
    _artwork = snapshotData['artwork'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Auction');

  static Stream<AuctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuctionRecord.fromSnapshot(s));

  static Future<AuctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuctionRecord.fromSnapshot(s));

  static AuctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuctionRecordData({
  DateTime? startDate,
  DateTime? endDate,
  double? initialPrice,
  double? currentPrice,
  Status? status,
  DocumentReference? ownerId,
  DocumentReference? artwork,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'start_date': startDate,
      'end_date': endDate,
      'initial_price': initialPrice,
      'current_price': currentPrice,
      'status': status,
      'ownerId': ownerId,
      'artwork': artwork,
    }.withoutNulls,
  );

  return firestoreData;
}

class AuctionRecordDocumentEquality implements Equality<AuctionRecord> {
  const AuctionRecordDocumentEquality();

  @override
  bool equals(AuctionRecord? e1, AuctionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.initialPrice == e2?.initialPrice &&
        e1?.currentPrice == e2?.currentPrice &&
        listEquality.equals(e1?.bids, e2?.bids) &&
        e1?.status == e2?.status &&
        e1?.ownerId == e2?.ownerId &&
        e1?.artwork == e2?.artwork;
  }

  @override
  int hash(AuctionRecord? e) => const ListEquality().hash([
        e?.startDate,
        e?.endDate,
        e?.initialPrice,
        e?.currentPrice,
        e?.bids,
        e?.status,
        e?.ownerId,
        e?.artwork
      ]);

  @override
  bool isValidKey(Object? o) => o is AuctionRecord;
}
