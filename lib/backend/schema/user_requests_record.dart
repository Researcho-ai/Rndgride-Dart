import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRequestsRecord extends FirestoreRecord {
  UserRequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_request" field.
  String? _userRequest;
  String get userRequest => _userRequest ?? '';
  bool hasUserRequest() => _userRequest != null;

  // "is_user_request_seen" field.
  bool? _isUserRequestSeen;
  bool get isUserRequestSeen => _isUserRequestSeen ?? false;
  bool hasIsUserRequestSeen() => _isUserRequestSeen != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_archived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "is_request_resolved" field.
  bool? _isRequestResolved;
  bool get isRequestResolved => _isRequestResolved ?? false;
  bool hasIsRequestResolved() => _isRequestResolved != null;

  // "needed_in" field.
  String? _neededIn;
  String get neededIn => _neededIn ?? '';
  bool hasNeededIn() => _neededIn != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userRequest = snapshotData['user_request'] as String?;
    _isUserRequestSeen = snapshotData['is_user_request_seen'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isArchived = snapshotData['is_archived'] as bool?;
    _tag = snapshotData['tag'] as String?;
    _isRequestResolved = snapshotData['is_request_resolved'] as bool?;
    _neededIn = snapshotData['needed_in'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_requests')
          : FirebaseFirestore.instance.collectionGroup('user_requests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_requests').doc(id);

  static Stream<UserRequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRequestsRecord.fromSnapshot(s));

  static Future<UserRequestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRequestsRecord.fromSnapshot(s));

  static UserRequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRequestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRequestsRecordData({
  String? userRequest,
  bool? isUserRequestSeen,
  DateTime? timestamp,
  bool? isArchived,
  String? tag,
  bool? isRequestResolved,
  String? neededIn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_request': userRequest,
      'is_user_request_seen': isUserRequestSeen,
      'timestamp': timestamp,
      'is_archived': isArchived,
      'tag': tag,
      'is_request_resolved': isRequestResolved,
      'needed_in': neededIn,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRequestsRecordDocumentEquality
    implements Equality<UserRequestsRecord> {
  const UserRequestsRecordDocumentEquality();

  @override
  bool equals(UserRequestsRecord? e1, UserRequestsRecord? e2) {
    return e1?.userRequest == e2?.userRequest &&
        e1?.isUserRequestSeen == e2?.isUserRequestSeen &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isArchived == e2?.isArchived &&
        e1?.tag == e2?.tag &&
        e1?.isRequestResolved == e2?.isRequestResolved &&
        e1?.neededIn == e2?.neededIn;
  }

  @override
  int hash(UserRequestsRecord? e) => const ListEquality().hash([
        e?.userRequest,
        e?.isUserRequestSeen,
        e?.timestamp,
        e?.isArchived,
        e?.tag,
        e?.isRequestResolved,
        e?.neededIn
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRequestsRecord;
}
