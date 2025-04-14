import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TermContentsRecord extends FirestoreRecord {
  TermContentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "parent_document_name" field.
  String? _parentDocumentName;
  String get parentDocumentName => _parentDocumentName ?? '';
  bool hasParentDocumentName() => _parentDocumentName != null;

  // "term_title" field.
  String? _termTitle;
  String get termTitle => _termTitle ?? '';
  bool hasTermTitle() => _termTitle != null;

  // "term_description" field.
  String? _termDescription;
  String get termDescription => _termDescription ?? '';
  bool hasTermDescription() => _termDescription != null;

  // "term_index" field.
  int? _termIndex;
  int get termIndex => _termIndex ?? 0;
  bool hasTermIndex() => _termIndex != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _parentDocumentName = snapshotData['parent_document_name'] as String?;
    _termTitle = snapshotData['term_title'] as String?;
    _termDescription = snapshotData['term_description'] as String?;
    _termIndex = castToType<int>(snapshotData['term_index']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('term_contents')
          : FirebaseFirestore.instance.collectionGroup('term_contents');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('term_contents').doc(id);

  static Stream<TermContentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TermContentsRecord.fromSnapshot(s));

  static Future<TermContentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TermContentsRecord.fromSnapshot(s));

  static TermContentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TermContentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TermContentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TermContentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TermContentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TermContentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTermContentsRecordData({
  String? parentDocumentName,
  String? termTitle,
  String? termDescription,
  int? termIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parent_document_name': parentDocumentName,
      'term_title': termTitle,
      'term_description': termDescription,
      'term_index': termIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class TermContentsRecordDocumentEquality
    implements Equality<TermContentsRecord> {
  const TermContentsRecordDocumentEquality();

  @override
  bool equals(TermContentsRecord? e1, TermContentsRecord? e2) {
    return e1?.parentDocumentName == e2?.parentDocumentName &&
        e1?.termTitle == e2?.termTitle &&
        e1?.termDescription == e2?.termDescription &&
        e1?.termIndex == e2?.termIndex;
  }

  @override
  int hash(TermContentsRecord? e) => const ListEquality().hash(
      [e?.parentDocumentName, e?.termTitle, e?.termDescription, e?.termIndex]);

  @override
  bool isValidKey(Object? o) => o is TermContentsRecord;
}
