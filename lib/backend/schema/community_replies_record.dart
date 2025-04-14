import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunityRepliesRecord extends FirestoreRecord {
  CommunityRepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "community_comment_ref" field.
  DocumentReference? _communityCommentRef;
  DocumentReference? get communityCommentRef => _communityCommentRef;
  bool hasCommunityCommentRef() => _communityCommentRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _reply = snapshotData['reply'] as String?;
    _communityCommentRef =
        snapshotData['community_comment_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('community_replies')
          : FirebaseFirestore.instance.collectionGroup('community_replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('community_replies').doc(id);

  static Stream<CommunityRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunityRepliesRecord.fromSnapshot(s));

  static Future<CommunityRepliesRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CommunityRepliesRecord.fromSnapshot(s));

  static CommunityRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunityRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunityRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunityRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunityRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunityRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunityRepliesRecordData({
  DateTime? timeStamp,
  String? reply,
  DocumentReference? communityCommentRef,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_stamp': timeStamp,
      'reply': reply,
      'community_comment_ref': communityCommentRef,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunityRepliesRecordDocumentEquality
    implements Equality<CommunityRepliesRecord> {
  const CommunityRepliesRecordDocumentEquality();

  @override
  bool equals(CommunityRepliesRecord? e1, CommunityRepliesRecord? e2) {
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.reply == e2?.reply &&
        e1?.communityCommentRef == e2?.communityCommentRef &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(CommunityRepliesRecord? e) => const ListEquality()
      .hash([e?.timeStamp, e?.reply, e?.communityCommentRef, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is CommunityRepliesRecord;
}
