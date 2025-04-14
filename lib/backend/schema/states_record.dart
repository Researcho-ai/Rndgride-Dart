import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatesRecord extends FirestoreRecord {
  StatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "state_name" field.
  String? _stateName;
  String get stateName => _stateName ?? '';
  bool hasStateName() => _stateName != null;

  void _initializeFields() {
    _stateName = snapshotData['state_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('states');

  static Stream<StatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StatesRecord.fromSnapshot(s));

  static Future<StatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StatesRecord.fromSnapshot(s));

  static StatesRecord fromSnapshot(DocumentSnapshot snapshot) => StatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStatesRecordData({
  String? stateName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'state_name': stateName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StatesRecordDocumentEquality implements Equality<StatesRecord> {
  const StatesRecordDocumentEquality();

  @override
  bool equals(StatesRecord? e1, StatesRecord? e2) {
    return e1?.stateName == e2?.stateName;
  }

  @override
  int hash(StatesRecord? e) => const ListEquality().hash([e?.stateName]);

  @override
  bool isValidKey(Object? o) => o is StatesRecord;
}
