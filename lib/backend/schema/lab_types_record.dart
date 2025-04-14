import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabTypesRecord extends FirestoreRecord {
  LabTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lab_type" field.
  String? _labType;
  String get labType => _labType ?? '';
  bool hasLabType() => _labType != null;

  // "lab_sub_type" field.
  String? _labSubType;
  String get labSubType => _labSubType ?? '';
  bool hasLabSubType() => _labSubType != null;

  void _initializeFields() {
    _labType = snapshotData['lab_type'] as String?;
    _labSubType = snapshotData['lab_sub_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lab_types');

  static Stream<LabTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabTypesRecord.fromSnapshot(s));

  static Future<LabTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabTypesRecord.fromSnapshot(s));

  static LabTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LabTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabTypesRecordData({
  String? labType,
  String? labSubType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lab_type': labType,
      'lab_sub_type': labSubType,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabTypesRecordDocumentEquality implements Equality<LabTypesRecord> {
  const LabTypesRecordDocumentEquality();

  @override
  bool equals(LabTypesRecord? e1, LabTypesRecord? e2) {
    return e1?.labType == e2?.labType && e1?.labSubType == e2?.labSubType;
  }

  @override
  int hash(LabTypesRecord? e) =>
      const ListEquality().hash([e?.labType, e?.labSubType]);

  @override
  bool isValidKey(Object? o) => o is LabTypesRecord;
}
