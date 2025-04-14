import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookmarkedInstrumentsRecord extends FirestoreRecord {
  BookmarkedInstrumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bookmark_timestamp" field.
  DateTime? _bookmarkTimestamp;
  DateTime? get bookmarkTimestamp => _bookmarkTimestamp;
  bool hasBookmarkTimestamp() => _bookmarkTimestamp != null;

  // "instrument_test_ref" field.
  DocumentReference? _instrumentTestRef;
  DocumentReference? get instrumentTestRef => _instrumentTestRef;
  bool hasInstrumentTestRef() => _instrumentTestRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookmarkTimestamp = snapshotData['bookmark_timestamp'] as DateTime?;
    _instrumentTestRef =
        snapshotData['instrument_test_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookmarked_instruments')
          : FirebaseFirestore.instance
              .collectionGroup('bookmarked_instruments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('bookmarked_instruments').doc(id);

  static Stream<BookmarkedInstrumentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => BookmarkedInstrumentsRecord.fromSnapshot(s));

  static Future<BookmarkedInstrumentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BookmarkedInstrumentsRecord.fromSnapshot(s));

  static BookmarkedInstrumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookmarkedInstrumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookmarkedInstrumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookmarkedInstrumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookmarkedInstrumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookmarkedInstrumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookmarkedInstrumentsRecordData({
  DateTime? bookmarkTimestamp,
  DocumentReference? instrumentTestRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookmark_timestamp': bookmarkTimestamp,
      'instrument_test_ref': instrumentTestRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookmarkedInstrumentsRecordDocumentEquality
    implements Equality<BookmarkedInstrumentsRecord> {
  const BookmarkedInstrumentsRecordDocumentEquality();

  @override
  bool equals(
      BookmarkedInstrumentsRecord? e1, BookmarkedInstrumentsRecord? e2) {
    return e1?.bookmarkTimestamp == e2?.bookmarkTimestamp &&
        e1?.instrumentTestRef == e2?.instrumentTestRef;
  }

  @override
  int hash(BookmarkedInstrumentsRecord? e) =>
      const ListEquality().hash([e?.bookmarkTimestamp, e?.instrumentTestRef]);

  @override
  bool isValidKey(Object? o) => o is BookmarkedInstrumentsRecord;
}
