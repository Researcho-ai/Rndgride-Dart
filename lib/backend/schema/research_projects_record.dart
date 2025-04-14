import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResearchProjectsRecord extends FirestoreRecord {
  ResearchProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "sector" field.
  String? _sector;
  String get sector => _sector ?? '';
  bool hasSector() => _sector != null;

  // "abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  // "attachment" field.
  String? _attachment;
  String get attachment => _attachment ?? '';
  bool hasAttachment() => _attachment != null;

  // "project_type" field.
  String? _projectType;
  String get projectType => _projectType ?? '';
  bool hasProjectType() => _projectType != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _sector = snapshotData['sector'] as String?;
    _abstract = snapshotData['abstract'] as String?;
    _attachment = snapshotData['attachment'] as String?;
    _projectType = snapshotData['project_type'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('research_projects')
          : FirebaseFirestore.instance.collectionGroup('research_projects');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('research_projects').doc(id);

  static Stream<ResearchProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResearchProjectsRecord.fromSnapshot(s));

  static Future<ResearchProjectsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ResearchProjectsRecord.fromSnapshot(s));

  static ResearchProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResearchProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResearchProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResearchProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResearchProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResearchProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResearchProjectsRecordData({
  String? title,
  String? sector,
  String? abstract,
  String? attachment,
  String? projectType,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'sector': sector,
      'abstract': abstract,
      'attachment': attachment,
      'project_type': projectType,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResearchProjectsRecordDocumentEquality
    implements Equality<ResearchProjectsRecord> {
  const ResearchProjectsRecordDocumentEquality();

  @override
  bool equals(ResearchProjectsRecord? e1, ResearchProjectsRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.sector == e2?.sector &&
        e1?.abstract == e2?.abstract &&
        e1?.attachment == e2?.attachment &&
        e1?.projectType == e2?.projectType &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ResearchProjectsRecord? e) => const ListEquality().hash([
        e?.title,
        e?.sector,
        e?.abstract,
        e?.attachment,
        e?.projectType,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is ResearchProjectsRecord;
}
