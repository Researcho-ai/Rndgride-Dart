import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkedJobsRecord extends FirestoreRecord {
  BookmarkedJobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_ref" field.
  DocumentReference? _jobRef;
  DocumentReference? get jobRef => _jobRef;
  bool hasJobRef() => _jobRef != null;

  // "bookmark_timestamp" field.
  DateTime? _bookmarkTimestamp;
  DateTime? get bookmarkTimestamp => _bookmarkTimestamp;
  bool hasBookmarkTimestamp() => _bookmarkTimestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobRef = snapshotData['job_ref'] as DocumentReference?;
    _bookmarkTimestamp = snapshotData['bookmark_timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarked_jobs')
          : FirebaseFirestore.instance.collectionGroup('bookmarked_jobs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookmarked_jobs').doc(id);

  static Stream<BookmarkedJobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkedJobsRecord.fromSnapshot(s));

  static Future<BookmarkedJobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarkedJobsRecord.fromSnapshot(s));

  static BookmarkedJobsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkedJobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkedJobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkedJobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkedJobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkedJobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkedJobsRecordData({
  DocumentReference? jobRef,
  DateTime? bookmarkTimestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_ref': jobRef,
      'bookmark_timestamp': bookmarkTimestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkedJobsRecordDocumentEquality
    implements Equality<BookmarkedJobsRecord> {
  const BookmarkedJobsRecordDocumentEquality();

  @override
  bool equals(BookmarkedJobsRecord? e1, BookmarkedJobsRecord? e2) {
    return e1?.jobRef == e2?.jobRef &&
        e1?.bookmarkTimestamp == e2?.bookmarkTimestamp;
  }

  @override
  int hash(BookmarkedJobsRecord? e) =>
      const ListEquality().hash([e?.jobRef, e?.bookmarkTimestamp]);

  @override
  bool isValidKey(Object? o) => o is BookmarkedJobsRecord;
}
