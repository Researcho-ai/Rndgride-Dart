import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminNotificationsRecord extends FirestoreRecord {
  AdminNotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_message" field.
  String? _notificationMessage;
  String get notificationMessage => _notificationMessage ?? '';
  bool hasNotificationMessage() => _notificationMessage != null;

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "lab_ref" field.
  DocumentReference? _labRef;
  DocumentReference? get labRef => _labRef;
  bool hasLabRef() => _labRef != null;

  // "is_notification_seen" field.
  bool? _isNotificationSeen;
  bool get isNotificationSeen => _isNotificationSeen ?? false;
  bool hasIsNotificationSeen() => _isNotificationSeen != null;

  // "is_archived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "institute_ref" field.
  DocumentReference? _instituteRef;
  DocumentReference? get instituteRef => _instituteRef;
  bool hasInstituteRef() => _instituteRef != null;

  // "lab_name" field.
  String? _labName;
  String get labName => _labName ?? '';
  bool hasLabName() => _labName != null;

  // "institute_name" field.
  String? _instituteName;
  String get instituteName => _instituteName ?? '';
  bool hasInstituteName() => _instituteName != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  void _initializeFields() {
    _notificationMessage = snapshotData['notification_message'] as String?;
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _labRef = snapshotData['lab_ref'] as DocumentReference?;
    _isNotificationSeen = snapshotData['is_notification_seen'] as bool?;
    _isArchived = snapshotData['is_archived'] as bool?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _instituteRef = snapshotData['institute_ref'] as DocumentReference?;
    _labName = snapshotData['lab_name'] as String?;
    _instituteName = snapshotData['institute_name'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('admin_notifications');

  static Stream<AdminNotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminNotificationsRecord.fromSnapshot(s));

  static Future<AdminNotificationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AdminNotificationsRecord.fromSnapshot(s));

  static AdminNotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminNotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminNotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminNotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminNotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminNotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminNotificationsRecordData({
  String? notificationMessage,
  DateTime? timeStamp,
  DocumentReference? labRef,
  bool? isNotificationSeen,
  bool? isArchived,
  DocumentReference? userRef,
  DocumentReference? instituteRef,
  String? labName,
  String? instituteName,
  String? userName,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_message': notificationMessage,
      'time_stamp': timeStamp,
      'lab_ref': labRef,
      'is_notification_seen': isNotificationSeen,
      'is_archived': isArchived,
      'user_ref': userRef,
      'institute_ref': instituteRef,
      'lab_name': labName,
      'institute_name': instituteName,
      'user_name': userName,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminNotificationsRecordDocumentEquality
    implements Equality<AdminNotificationsRecord> {
  const AdminNotificationsRecordDocumentEquality();

  @override
  bool equals(AdminNotificationsRecord? e1, AdminNotificationsRecord? e2) {
    return e1?.notificationMessage == e2?.notificationMessage &&
        e1?.timeStamp == e2?.timeStamp &&
        e1?.labRef == e2?.labRef &&
        e1?.isNotificationSeen == e2?.isNotificationSeen &&
        e1?.isArchived == e2?.isArchived &&
        e1?.userRef == e2?.userRef &&
        e1?.instituteRef == e2?.instituteRef &&
        e1?.labName == e2?.labName &&
        e1?.instituteName == e2?.instituteName &&
        e1?.userName == e2?.userName &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(AdminNotificationsRecord? e) => const ListEquality().hash([
        e?.notificationMessage,
        e?.timeStamp,
        e?.labRef,
        e?.isNotificationSeen,
        e?.isArchived,
        e?.userRef,
        e?.instituteRef,
        e?.labName,
        e?.instituteName,
        e?.userName,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminNotificationsRecord;
}
