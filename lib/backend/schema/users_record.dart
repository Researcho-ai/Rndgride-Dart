import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "user_first_name" field.
  String? _userFirstName;
  String get userFirstName => _userFirstName ?? '';
  bool hasUserFirstName() => _userFirstName != null;

  // "user_last_name" field.
  String? _userLastName;
  String get userLastName => _userLastName ?? '';
  bool hasUserLastName() => _userLastName != null;

  // "user_profile_status" field.
  bool? _userProfileStatus;
  bool get userProfileStatus => _userProfileStatus ?? false;
  bool hasUserProfileStatus() => _userProfileStatus != null;

  // "user_affiliation" field.
  String? _userAffiliation;
  String get userAffiliation => _userAffiliation ?? '';
  bool hasUserAffiliation() => _userAffiliation != null;

  // "user_research_field" field.
  String? _userResearchField;
  String get userResearchField => _userResearchField ?? '';
  bool hasUserResearchField() => _userResearchField != null;

  // "user_required_resources" field.
  String? _userRequiredResources;
  String get userRequiredResources => _userRequiredResources ?? '';
  bool hasUserRequiredResources() => _userRequiredResources != null;

  // "user_type_ref" field.
  DocumentReference? _userTypeRef;
  DocumentReference? get userTypeRef => _userTypeRef;
  bool hasUserTypeRef() => _userTypeRef != null;

  // "user_requests" field.
  List<UserRequestsStruct>? _userRequests;
  List<UserRequestsStruct> get userRequests => _userRequests ?? const [];
  bool hasUserRequests() => _userRequests != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "isDevloper" field.
  bool? _isDevloper;
  bool get isDevloper => _isDevloper ?? false;
  bool hasIsDevloper() => _isDevloper != null;

  // "research_intro" field.
  String? _researchIntro;
  String get researchIntro => _researchIntro ?? '';
  bool hasResearchIntro() => _researchIntro != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _userFirstName = snapshotData['user_first_name'] as String?;
    _userLastName = snapshotData['user_last_name'] as String?;
    _userProfileStatus = snapshotData['user_profile_status'] as bool?;
    _userAffiliation = snapshotData['user_affiliation'] as String?;
    _userResearchField = snapshotData['user_research_field'] as String?;
    _userRequiredResources = snapshotData['user_required_resources'] as String?;
    _userTypeRef = snapshotData['user_type_ref'] as DocumentReference?;
    _userRequests = getStructList(
      snapshotData['user_requests'],
      UserRequestsStruct.fromMap,
    );
    _email = snapshotData['email'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isDevloper = snapshotData['isDevloper'] as bool?;
    _researchIntro = snapshotData['research_intro'] as String?;
    _skills = getDataList(snapshotData['skills']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? userFirstName,
  String? userLastName,
  bool? userProfileStatus,
  String? userAffiliation,
  String? userResearchField,
  String? userRequiredResources,
  DocumentReference? userTypeRef,
  String? email,
  String? phoneNumber,
  String? photoUrl,
  bool? isDevloper,
  String? researchIntro,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'user_first_name': userFirstName,
      'user_last_name': userLastName,
      'user_profile_status': userProfileStatus,
      'user_affiliation': userAffiliation,
      'user_research_field': userResearchField,
      'user_required_resources': userRequiredResources,
      'user_type_ref': userTypeRef,
      'email': email,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'isDevloper': isDevloper,
      'research_intro': researchIntro,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.userFirstName == e2?.userFirstName &&
        e1?.userLastName == e2?.userLastName &&
        e1?.userProfileStatus == e2?.userProfileStatus &&
        e1?.userAffiliation == e2?.userAffiliation &&
        e1?.userResearchField == e2?.userResearchField &&
        e1?.userRequiredResources == e2?.userRequiredResources &&
        e1?.userTypeRef == e2?.userTypeRef &&
        listEquality.equals(e1?.userRequests, e2?.userRequests) &&
        e1?.email == e2?.email &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isDevloper == e2?.isDevloper &&
        e1?.researchIntro == e2?.researchIntro &&
        listEquality.equals(e1?.skills, e2?.skills);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.displayName,
        e?.userFirstName,
        e?.userLastName,
        e?.userProfileStatus,
        e?.userAffiliation,
        e?.userResearchField,
        e?.userRequiredResources,
        e?.userTypeRef,
        e?.userRequests,
        e?.email,
        e?.phoneNumber,
        e?.photoUrl,
        e?.isDevloper,
        e?.researchIntro,
        e?.skills
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
