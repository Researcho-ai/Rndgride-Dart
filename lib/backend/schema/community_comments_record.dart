import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityCommentsRecord extends FirestoreRecord {
  CommunityCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "like_count" field.
  List<DocumentReference>? _likeCount;
  List<DocumentReference> get likeCount => _likeCount ?? const [];
  bool hasLikeCount() => _likeCount != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _likeCount = getDataList(snapshotData['like_count']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('community_comments')
          : FirebaseFirestore.instance.collectionGroup('community_comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('community_comments').doc(id);

  static Stream<CommunityCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityCommentsRecord.fromSnapshot(s));

  static Future<CommunityCommentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CommunityCommentsRecord.fromSnapshot(s));

  static CommunityCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityCommentsRecordData({
  String? comment,
  DateTime? timeStamp,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'time_stamp': timeStamp,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityCommentsRecordDocumentEquality
    implements Equality<CommunityCommentsRecord> {
  const CommunityCommentsRecordDocumentEquality();

  @override
  bool equals(CommunityCommentsRecord? e1, CommunityCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.comment == e2?.comment &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.likeCount, e2?.likeCount);
  }

  @override
  int hash(CommunityCommentsRecord? e) => const ListEquality()
      .hash([e?.comment, e?.timeStamp, e?.userRef, e?.likeCount]);

  @override
  bool isValidKey(Object? o) => o is CommunityCommentsRecord;
}
