import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CertificateTypesRecord extends FirestoreRecord {
  CertificateTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "certificate_name" field.
  String? _certificateName;
  String get certificateName => _certificateName ?? '';
  bool hasCertificateName() => _certificateName != null;

  void _initializeFields() {
    _certificateName = snapshotData['certificate_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('certificate_types');

  static Stream<CertificateTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CertificateTypesRecord.fromSnapshot(s));

  static Future<CertificateTypesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CertificateTypesRecord.fromSnapshot(s));

  static CertificateTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CertificateTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CertificateTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CertificateTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CertificateTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CertificateTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCertificateTypesRecordData({
  String? certificateName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'certificate_name': certificateName,
    }.withoutNulls,
  );

  return firestoreData;
}

class CertificateTypesRecordDocumentEquality
    implements Equality<CertificateTypesRecord> {
  const CertificateTypesRecordDocumentEquality();

  @override
  bool equals(CertificateTypesRecord? e1, CertificateTypesRecord? e2) {
    return e1?.certificateName == e2?.certificateName;
  }

  @override
  int hash(CertificateTypesRecord? e) =>
      const ListEquality().hash([e?.certificateName]);

  @override
  bool isValidKey(Object? o) => o is CertificateTypesRecord;
}
