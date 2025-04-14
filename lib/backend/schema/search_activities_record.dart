import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchActivitiesRecord extends FirestoreRecord {
  SearchActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "search_count" field.
  int? _searchCount;
  int get searchCount => _searchCount ?? 0;
  bool hasSearchCount() => _searchCount != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "lab_ref" field.
  DocumentReference? _labRef;
  DocumentReference? get labRef => _labRef;
  bool hasLabRef() => _labRef != null;

  // "instrument_ref" field.
  DocumentReference? _instrumentRef;
  DocumentReference? get instrumentRef => _instrumentRef;
  bool hasInstrumentRef() => _instrumentRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _searchCount = castToType<int>(snapshotData['search_count']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _labRef = snapshotData['lab_ref'] as DocumentReference?;
    _instrumentRef = snapshotData['instrument_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('search_activities')
          : FirebaseFirestore.instance.collectionGroup('search_activities');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('search_activities').doc(id);

  static Stream<SearchActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SearchActivitiesRecord.fromSnapshot(s));

  static Future<SearchActivitiesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SearchActivitiesRecord.fromSnapshot(s));

  static SearchActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SearchActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SearchActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SearchActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SearchActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SearchActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSearchActivitiesRecordData({
  DateTime? timeStamp,
  int? searchCount,
  DocumentReference? userRef,
  DocumentReference? labRef,
  DocumentReference? instrumentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_stamp': timeStamp,
      'search_count': searchCount,
      'user_ref': userRef,
      'lab_ref': labRef,
      'instrument_ref': instrumentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class SearchActivitiesRecordDocumentEquality
    implements Equality<SearchActivitiesRecord> {
  const SearchActivitiesRecordDocumentEquality();

  @override
  bool equals(SearchActivitiesRecord? e1, SearchActivitiesRecord? e2) {
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.searchCount == e2?.searchCount &&
        e1?.userRef == e2?.userRef &&
        e1?.labRef == e2?.labRef &&
        e1?.instrumentRef == e2?.instrumentRef;
  }

  @override
  int hash(SearchActivitiesRecord? e) => const ListEquality().hash(
      [e?.timeStamp, e?.searchCount, e?.userRef, e?.labRef, e?.instrumentRef]);

  @override
  bool isValidKey(Object? o) => o is SearchActivitiesRecord;
}
