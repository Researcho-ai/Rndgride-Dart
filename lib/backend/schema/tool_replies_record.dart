import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolRepliesRecord extends FirestoreRecord {
  ToolRepliesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  bool hasReply() => _reply != null;

  // "tool_comment_ref" field.
  DocumentReference? _toolCommentRef;
  DocumentReference? get toolCommentRef => _toolCommentRef;
  bool hasToolCommentRef() => _toolCommentRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "like_count" field.
  List<DocumentReference>? _likeCount;
  List<DocumentReference> get likeCount => _likeCount ?? const [];
  bool hasLikeCount() => _likeCount != null;

  // "mentioned_ref" field.
  DocumentReference? _mentionedRef;
  DocumentReference? get mentionedRef => _mentionedRef;
  bool hasMentionedRef() => _mentionedRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _reply = snapshotData['reply'] as String?;
    _toolCommentRef = snapshotData['tool_comment_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _likeCount = getDataList(snapshotData['like_count']);
    _mentionedRef = snapshotData['mentioned_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tool_replies')
          : FirebaseFirestore.instance.collectionGroup('tool_replies');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tool_replies').doc(id);

  static Stream<ToolRepliesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolRepliesRecord.fromSnapshot(s));

  static Future<ToolRepliesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolRepliesRecord.fromSnapshot(s));

  static ToolRepliesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ToolRepliesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolRepliesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolRepliesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolRepliesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolRepliesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolRepliesRecordData({
  String? reply,
  DocumentReference? toolCommentRef,
  DocumentReference? userRef,
  DateTime? timestamp,
  DocumentReference? mentionedRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reply': reply,
      'tool_comment_ref': toolCommentRef,
      'user_ref': userRef,
      'timestamp': timestamp,
      'mentioned_ref': mentionedRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToolRepliesRecordDocumentEquality implements Equality<ToolRepliesRecord> {
  const ToolRepliesRecordDocumentEquality();

  @override
  bool equals(ToolRepliesRecord? e1, ToolRepliesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.reply == e2?.reply &&
        e1?.toolCommentRef == e2?.toolCommentRef &&
        e1?.userRef == e2?.userRef &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.likeCount, e2?.likeCount) &&
        e1?.mentionedRef == e2?.mentionedRef;
  }

  @override
  int hash(ToolRepliesRecord? e) => const ListEquality().hash([
        e?.reply,
        e?.toolCommentRef,
        e?.userRef,
        e?.timestamp,
        e?.likeCount,
        e?.mentionedRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ToolRepliesRecord;
}
