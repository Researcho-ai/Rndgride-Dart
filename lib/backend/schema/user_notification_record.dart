import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserNotificationRecord extends FirestoreRecord {
  UserNotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "notification_message" field.
  String? _notificationMessage;
  String get notificationMessage => _notificationMessage ?? '';
  bool hasNotificationMessage() => _notificationMessage != null;

  // "post_ref" field.
  DocumentReference? _postRef;
  DocumentReference? get postRef => _postRef;
  bool hasPostRef() => _postRef != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "is_notification_seen" field.
  bool? _isNotificationSeen;
  bool get isNotificationSeen => _isNotificationSeen ?? false;
  bool hasIsNotificationSeen() => _isNotificationSeen != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _notificationMessage = snapshotData['notification_message'] as String?;
    _postRef = snapshotData['post_ref'] as DocumentReference?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _isNotificationSeen = snapshotData['is_notification_seen'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('user_notification')
          : FirebaseFirestore.instance.collectionGroup('user_notification');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('user_notification').doc(id);

  static Stream<UserNotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserNotificationRecord.fromSnapshot(s));

  static Future<UserNotificationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => UserNotificationRecord.fromSnapshot(s));

  static UserNotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserNotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserNotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserNotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserNotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserNotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserNotificationRecordData({
  DateTime? timeStamp,
  String? notificationMessage,
  DocumentReference? postRef,
  DocumentReference? userRef,
  bool? isNotificationSeen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_stamp': timeStamp,
      'notification_message': notificationMessage,
      'post_ref': postRef,
      'user_ref': userRef,
      'is_notification_seen': isNotificationSeen,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserNotificationRecordDocumentEquality
    implements Equality<UserNotificationRecord> {
  const UserNotificationRecordDocumentEquality();

  @override
  bool equals(UserNotificationRecord? e1, UserNotificationRecord? e2) {
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.notificationMessage == e2?.notificationMessage &&
        e1?.postRef == e2?.postRef &&
        e1?.userRef == e2?.userRef &&
        e1?.isNotificationSeen == e2?.isNotificationSeen;
  }

  @override
  int hash(UserNotificationRecord? e) => const ListEquality().hash([
        e?.timeStamp,
        e?.notificationMessage,
        e?.postRef,
        e?.userRef,
        e?.isNotificationSeen
      ]);

  @override
  bool isValidKey(Object? o) => o is UserNotificationRecord;
}
