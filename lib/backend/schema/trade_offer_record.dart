import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TradeOfferRecord extends FirestoreRecord {
  TradeOfferRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "offered_item" field.
  DocumentReference? _offeredItem;
  DocumentReference? get offeredItem => _offeredItem;
  bool hasOfferedItem() => _offeredItem != null;

  // "received_item" field.
  DocumentReference? _receivedItem;
  DocumentReference? get receivedItem => _receivedItem;
  bool hasReceivedItem() => _receivedItem != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "offer_item" field.
  String? _offerItem;
  String get offerItem => _offerItem ?? '';
  bool hasOfferItem() => _offerItem != null;

  void _initializeFields() {
    _offeredItem = snapshotData['offered_item'] as DocumentReference?;
    _receivedItem = snapshotData['received_item'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _offerItem = snapshotData['offer_item'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trade_offer');

  static Stream<TradeOfferRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TradeOfferRecord.fromSnapshot(s));

  static Future<TradeOfferRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TradeOfferRecord.fromSnapshot(s));

  static TradeOfferRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TradeOfferRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TradeOfferRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TradeOfferRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TradeOfferRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TradeOfferRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTradeOfferRecordData({
  DocumentReference? offeredItem,
  DocumentReference? receivedItem,
  String? description,
  DocumentReference? sender,
  DocumentReference? receiver,
  String? offerItem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'offered_item': offeredItem,
      'received_item': receivedItem,
      'description': description,
      'sender': sender,
      'receiver': receiver,
      'offer_item': offerItem,
    }.withoutNulls,
  );

  return firestoreData;
}

class TradeOfferRecordDocumentEquality implements Equality<TradeOfferRecord> {
  const TradeOfferRecordDocumentEquality();

  @override
  bool equals(TradeOfferRecord? e1, TradeOfferRecord? e2) {
    return e1?.offeredItem == e2?.offeredItem &&
        e1?.receivedItem == e2?.receivedItem &&
        e1?.description == e2?.description &&
        e1?.sender == e2?.sender &&
        e1?.receiver == e2?.receiver &&
        e1?.offerItem == e2?.offerItem;
  }

  @override
  int hash(TradeOfferRecord? e) => const ListEquality().hash([
        e?.offeredItem,
        e?.receivedItem,
        e?.description,
        e?.sender,
        e?.receiver,
        e?.offerItem
      ]);

  @override
  bool isValidKey(Object? o) => o is TradeOfferRecord;
}
