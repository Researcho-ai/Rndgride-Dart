import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResearchPapersRecord extends FirestoreRecord {
  ResearchPapersRecord._(
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

  // "journal" field.
  String? _journal;
  String get journal => _journal ?? '';
  bool hasJournal() => _journal != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  // "attachment" field.
  String? _attachment;
  String get attachment => _attachment ?? '';
  bool hasAttachment() => _attachment != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "abstract" field.
  String? _abstract;
  String get abstract => _abstract ?? '';
  bool hasAbstract() => _abstract != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _sector = snapshotData['sector'] as String?;
    _journal = snapshotData['journal'] as String?;
    _link = snapshotData['link'] as String?;
    _attachment = snapshotData['attachment'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _abstract = snapshotData['abstract'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('research_papers')
          : FirebaseFirestore.instance.collectionGroup('research_papers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('research_papers').doc(id);

  static Stream<ResearchPapersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResearchPapersRecord.fromSnapshot(s));

  static Future<ResearchPapersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResearchPapersRecord.fromSnapshot(s));

  static ResearchPapersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResearchPapersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResearchPapersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResearchPapersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResearchPapersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResearchPapersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResearchPapersRecordData({
  String? title,
  String? sector,
  String? journal,
  String? link,
  String? attachment,
  DateTime? timestamp,
  String? abstract,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'sector': sector,
      'journal': journal,
      'link': link,
      'attachment': attachment,
      'timestamp': timestamp,
      'abstract': abstract,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResearchPapersRecordDocumentEquality
    implements Equality<ResearchPapersRecord> {
  const ResearchPapersRecordDocumentEquality();

  @override
  bool equals(ResearchPapersRecord? e1, ResearchPapersRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.sector == e2?.sector &&
        e1?.journal == e2?.journal &&
        e1?.link == e2?.link &&
        e1?.attachment == e2?.attachment &&
        e1?.timestamp == e2?.timestamp &&
        e1?.abstract == e2?.abstract;
  }

  @override
  int hash(ResearchPapersRecord? e) => const ListEquality().hash([
        e?.title,
        e?.sector,
        e?.journal,
        e?.link,
        e?.attachment,
        e?.timestamp,
        e?.abstract
      ]);

  @override
  bool isValidKey(Object? o) => o is ResearchPapersRecord;
}
