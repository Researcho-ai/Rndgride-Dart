import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommunitiesRecord extends FirestoreRecord {
  CommunitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "post" field.
  String? _post;
  String get post => _post ?? '';
  bool hasPost() => _post != null;

  // "post_photo_url" field.
  String? _postPhotoUrl;
  String get postPhotoUrl => _postPhotoUrl ?? '';
  bool hasPostPhotoUrl() => _postPhotoUrl != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "like_count" field.
  List<DocumentReference>? _likeCount;
  List<DocumentReference> get likeCount => _likeCount ?? const [];
  bool hasLikeCount() => _likeCount != null;

  void _initializeFields() {
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _post = snapshotData['post'] as String?;
    _postPhotoUrl = snapshotData['post_photo_url'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _likeCount = getDataList(snapshotData['like_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('communities');

  static Stream<CommunitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CommunitiesRecord.fromSnapshot(s));

  static Future<CommunitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CommunitiesRecord.fromSnapshot(s));

  static CommunitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CommunitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CommunitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CommunitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CommunitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CommunitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCommunitiesRecordData({
  DateTime? timeStamp,
  String? post,
  String? postPhotoUrl,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_stamp': timeStamp,
      'post': post,
      'post_photo_url': postPhotoUrl,
      'user_ref': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CommunitiesRecordDocumentEquality implements Equality<CommunitiesRecord> {
  const CommunitiesRecordDocumentEquality();

  @override
  bool equals(CommunitiesRecord? e1, CommunitiesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.post == e2?.post &&
        e1?.postPhotoUrl == e2?.postPhotoUrl &&
        e1?.userRef == e2?.userRef &&
        listEquality.equals(e1?.likeCount, e2?.likeCount);
  }

  @override
  int hash(CommunitiesRecord? e) => const ListEquality()
      .hash([e?.timeStamp, e?.post, e?.postPhotoUrl, e?.userRef, e?.likeCount]);

  @override
  bool isValidKey(Object? o) => o is CommunitiesRecord;
}
