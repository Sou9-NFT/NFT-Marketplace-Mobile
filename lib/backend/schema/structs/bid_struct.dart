// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BidStruct extends FFFirebaseStruct {
  BidStruct({
    DocumentReference? bidderid,
    double? bidValue,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bidderid = bidderid,
        _bidValue = bidValue,
        super(firestoreUtilData);

  // "bidderid" field.
  DocumentReference? _bidderid;
  DocumentReference? get bidderid => _bidderid;
  set bidderid(DocumentReference? val) => _bidderid = val;

  bool hasBidderid() => _bidderid != null;

  // "bid_value" field.
  double? _bidValue;
  double get bidValue => _bidValue ?? 0.0;
  set bidValue(double? val) => _bidValue = val;

  void incrementBidValue(double amount) => bidValue = bidValue + amount;

  bool hasBidValue() => _bidValue != null;

  static BidStruct fromMap(Map<String, dynamic> data) => BidStruct(
        bidderid: data['bidderid'] as DocumentReference?,
        bidValue: castToType<double>(data['bid_value']),
      );

  static BidStruct? maybeFromMap(dynamic data) =>
      data is Map ? BidStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bidderid': _bidderid,
        'bid_value': _bidValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bidderid': serializeParam(
          _bidderid,
          ParamType.DocumentReference,
        ),
        'bid_value': serializeParam(
          _bidValue,
          ParamType.double,
        ),
      }.withoutNulls;

  static BidStruct fromSerializableMap(Map<String, dynamic> data) => BidStruct(
        bidderid: deserializeParam(
          data['bidderid'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        bidValue: deserializeParam(
          data['bid_value'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BidStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BidStruct &&
        bidderid == other.bidderid &&
        bidValue == other.bidValue;
  }

  @override
  int get hashCode => const ListEquality().hash([bidderid, bidValue]);
}

BidStruct createBidStruct({
  DocumentReference? bidderid,
  double? bidValue,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BidStruct(
      bidderid: bidderid,
      bidValue: bidValue,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BidStruct? updateBidStruct(
  BidStruct? bid, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bid
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBidStructData(
  Map<String, dynamic> firestoreData,
  BidStruct? bid,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bid == null) {
    return;
  }
  if (bid.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && bid.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bidData = getBidFirestoreData(bid, forFieldValue);
  final nestedData = bidData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bid.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBidFirestoreData(
  BidStruct? bid, [
  bool forFieldValue = false,
]) {
  if (bid == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bid.toMap());

  // Add any Firestore field values
  bid.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBidListFirestoreData(
  List<BidStruct>? bids,
) =>
    bids?.map((e) => getBidFirestoreData(e, true)).toList() ?? [];
