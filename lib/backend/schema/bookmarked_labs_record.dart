import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkedLabsRecord extends FirestoreRecord {
  BookmarkedLabsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "lab_ref" field.
  DocumentReference? _labRef;
  DocumentReference? get labRef => _labRef;
  bool hasLabRef() => _labRef != null;

  // "bookmark_timestamp" field.
  DateTime? _bookmarkTimestamp;
  DateTime? get bookmarkTimestamp => _bookmarkTimestamp;
  bool hasBookmarkTimestamp() => _bookmarkTimestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _labRef = snapshotData['lab_ref'] as DocumentReference?;
    _bookmarkTimestamp = snapshotData['bookmark_timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarked_labs')
          : FirebaseFirestore.instance.collectionGroup('bookmarked_labs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookmarked_labs').doc(id);

  static Stream<BookmarkedLabsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkedLabsRecord.fromSnapshot(s));

  static Future<BookmarkedLabsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookmarkedLabsRecord.fromSnapshot(s));

  static BookmarkedLabsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkedLabsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkedLabsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkedLabsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkedLabsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkedLabsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkedLabsRecordData({
  DocumentReference? labRef,
  DateTime? bookmarkTimestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'lab_ref': labRef,
      'bookmark_timestamp': bookmarkTimestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkedLabsRecordDocumentEquality
    implements Equality<BookmarkedLabsRecord> {
  const BookmarkedLabsRecordDocumentEquality();

  @override
  bool equals(BookmarkedLabsRecord? e1, BookmarkedLabsRecord? e2) {
    return e1?.labRef == e2?.labRef &&
        e1?.bookmarkTimestamp == e2?.bookmarkTimestamp;
  }

  @override
  int hash(BookmarkedLabsRecord? e) =>
      const ListEquality().hash([e?.labRef, e?.bookmarkTimestamp]);

  @override
  bool isValidKey(Object? o) => o is BookmarkedLabsRecord;
}
