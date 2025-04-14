import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobTypesRecord extends FirestoreRecord {
  JobTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_type" field.
  String? _jobType;
  String get jobType => _jobType ?? '';
  bool hasJobType() => _jobType != null;

  void _initializeFields() {
    _jobType = snapshotData['job_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('job_types');

  static Stream<JobTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobTypesRecord.fromSnapshot(s));

  static Future<JobTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobTypesRecord.fromSnapshot(s));

  static JobTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JobTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobTypesRecordData({
  String? jobType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_type': jobType,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobTypesRecordDocumentEquality implements Equality<JobTypesRecord> {
  const JobTypesRecordDocumentEquality();

  @override
  bool equals(JobTypesRecord? e1, JobTypesRecord? e2) {
    return e1?.jobType == e2?.jobType;
  }

  @override
  int hash(JobTypesRecord? e) => const ListEquality().hash([e?.jobType]);

  @override
  bool isValidKey(Object? o) => o is JobTypesRecord;
}
