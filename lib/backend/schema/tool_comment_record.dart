import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolCommentRecord extends FirestoreRecord {
  ToolCommentRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "upvote_count" field.
  List<DocumentReference>? _upvoteCount;
  List<DocumentReference> get upvoteCount => _upvoteCount ?? const [];
  bool hasUpvoteCount() => _upvoteCount != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _upvoteCount = getDataList(snapshotData['upvote_count']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tool_comment')
          : FirebaseFirestore.instance.collectionGroup('tool_comment');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tool_comment').doc(id);

  static Stream<ToolCommentRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolCommentRecord.fromSnapshot(s));

  static Future<ToolCommentRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolCommentRecord.fromSnapshot(s));

  static ToolCommentRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToolCommentRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolCommentRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolCommentRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolCommentRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolCommentRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolCommentRecordData({
  String? comment,
  DocumentReference? userRef,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'user_ref': userRef,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToolCommentRecordDocumentEquality implements Equality<ToolCommentRecord> {
  const ToolCommentRecordDocumentEquality();

  @override
  bool equals(ToolCommentRecord? e1, ToolCommentRecord? e2) {
    const listEquality = ListEquality();
    return e1?.comment == e2?.comment &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.upvoteCount, e2?.upvoteCount) &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ToolCommentRecord? e) => const ListEquality()
      .hash([e?.comment, e?.userRef, e?.upvoteCount, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is ToolCommentRecord;
}
