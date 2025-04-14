import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IpPatentsRecord extends FirestoreRecord {
  IpPatentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "patent_status" field.
  String? _patentStatus;
  String get patentStatus => _patentStatus ?? '';
  bool hasPatentStatus() => _patentStatus != null;

  // "patent_no" field.
  String? _patentNo;
  String get patentNo => _patentNo ?? '';
  bool hasPatentNo() => _patentNo != null;

  // "abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  // "patent_field" field.
  String? _patentField;
  String get patentField => _patentField ?? '';
  bool hasPatentField() => _patentField != null;

  // "patent_applications" field.
  String? _patentApplications;
  String get patentApplications => _patentApplications ?? '';
  bool hasPatentApplications() => _patentApplications != null;

  // "attachment" field.
  String? _attachment;
  String get attachment => _attachment ?? '';
  bool hasAttachment() => _attachment != null;

  // "interested_in_selling" field.
  bool? _interestedInSelling;
  bool get interestedInSelling => _interestedInSelling ?? false;
  bool hasInterestedInSelling() => _interestedInSelling != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "patentee_name" field.
  String? _patenteeName;
  String get patenteeName => _patenteeName ?? '';
  bool hasPatenteeName() => _patenteeName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _patentStatus = snapshotData['patent_status'] as String?;
    _patentNo = snapshotData['patent_no'] as String?;
    _abstract = snapshotData['abstract'] as String?;
    _patentField = snapshotData['patent_field'] as String?;
    _patentApplications = snapshotData['patent_applications'] as String?;
    _attachment = snapshotData['attachment'] as String?;
    _interestedInSelling = snapshotData['interested_in_selling'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _patenteeName = snapshotData['patentee_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ip_patents')
          : FirebaseFirestore.instance.collectionGroup('ip_patents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ip_patents').doc(id);

  static Stream<IpPatentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IpPatentsRecord.fromSnapshot(s));

  static Future<IpPatentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IpPatentsRecord.fromSnapshot(s));

  static IpPatentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IpPatentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IpPatentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IpPatentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IpPatentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IpPatentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIpPatentsRecordData({
  String? title,
  String? patentStatus,
  String? patentNo,
  String? abstract,
  String? patentField,
  String? patentApplications,
  String? attachment,
  bool? interestedInSelling,
  DateTime? timestamp,
  String? patenteeName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'patent_status': patentStatus,
      'patent_no': patentNo,
      'abstract': abstract,
      'patent_field': patentField,
      'patent_applications': patentApplications,
      'attachment': attachment,
      'interested_in_selling': interestedInSelling,
      'timestamp': timestamp,
      'patentee_name': patenteeName,
    }.withoutNulls,
  );

  return firestoreData;
}

class IpPatentsRecordDocumentEquality implements Equality<IpPatentsRecord> {
  const IpPatentsRecordDocumentEquality();

  @override
  bool equals(IpPatentsRecord? e1, IpPatentsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.patentStatus == e2?.patentStatus &&
        e1?.patentNo == e2?.patentNo &&
        e1?.abstract == e2?.abstract &&
        e1?.patentField == e2?.patentField &&
        e1?.patentApplications == e2?.patentApplications &&
        e1?.attachment == e2?.attachment &&
        e1?.interestedInSelling == e2?.interestedInSelling &&
        e1?.timestamp == e2?.timestamp &&
        e1?.patenteeName == e2?.patenteeName;
  }

  @override
  int hash(IpPatentsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.patentStatus,
        e?.patentNo,
        e?.abstract,
        e?.patentField,
        e?.patentApplications,
        e?.attachment,
        e?.interestedInSelling,
        e?.timestamp,
        e?.patenteeName
      ]);

  @override
  bool isValidKey(Object? o) => o is IpPatentsRecord;
}
