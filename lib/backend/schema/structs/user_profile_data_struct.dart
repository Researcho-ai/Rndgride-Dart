// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserProfileDataStruct extends FFFirebaseStruct {
  UserProfileDataStruct({
    String? uid,
    String? photoUrl,
    String? displayName,
    String? userAffiliation,
    String? userResearchField,
    String? userRequiredResources,
    String? userType,
    String? phoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _uid = uid,
        _photoUrl = photoUrl,
        _displayName = displayName,
        _userAffiliation = userAffiliation,
        _userResearchField = userResearchField,
        _userRequiredResources = userRequiredResources,
        _userType = userType,
        _phoneNumber = phoneNumber,
        super(firestoreUtilData);

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;

  bool hasPhotoUrl() => _photoUrl != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;

  bool hasDisplayName() => _displayName != null;

  // "user_affiliation" field.
  String? _userAffiliation;
  String get userAffiliation => _userAffiliation ?? '';
  set userAffiliation(String? val) => _userAffiliation = val;

  bool hasUserAffiliation() => _userAffiliation != null;

  // "user_research_field" field.
  String? _userResearchField;
  String get userResearchField => _userResearchField ?? '';
  set userResearchField(String? val) => _userResearchField = val;

  bool hasUserResearchField() => _userResearchField != null;

  // "user_required_resources" field.
  String? _userRequiredResources;
  String get userRequiredResources => _userRequiredResources ?? '';
  set userRequiredResources(String? val) => _userRequiredResources = val;

  bool hasUserRequiredResources() => _userRequiredResources != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static UserProfileDataStruct fromMap(Map<String, dynamic> data) =>
      UserProfileDataStruct(
        uid: data['uid'] as String?,
        photoUrl: data['photo_url'] as String?,
        displayName: data['display_name'] as String?,
        userAffiliation: data['user_affiliation'] as String?,
        userResearchField: data['user_research_field'] as String?,
        userRequiredResources: data['user_required_resources'] as String?,
        userType: data['user_type'] as String?,
        phoneNumber: data['phone_number'] as String?,
      );

  static UserProfileDataStruct? maybeFromMap(dynamic data) => data is Map
      ? UserProfileDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'uid': _uid,
        'photo_url': _photoUrl,
        'display_name': _displayName,
        'user_affiliation': _userAffiliation,
        'user_research_field': _userResearchField,
        'user_required_resources': _userRequiredResources,
        'user_type': _userType,
        'phone_number': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'user_affiliation': serializeParam(
          _userAffiliation,
          ParamType.String,
        ),
        'user_research_field': serializeParam(
          _userResearchField,
          ParamType.String,
        ),
        'user_required_resources': serializeParam(
          _userRequiredResources,
          ParamType.String,
        ),
        'user_type': serializeParam(
          _userType,
          ParamType.String,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserProfileDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserProfileDataStruct(
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        userAffiliation: deserializeParam(
          data['user_affiliation'],
          ParamType.String,
          false,
        ),
        userResearchField: deserializeParam(
          data['user_research_field'],
          ParamType.String,
          false,
        ),
        userRequiredResources: deserializeParam(
          data['user_required_resources'],
          ParamType.String,
          false,
        ),
        userType: deserializeParam(
          data['user_type'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserProfileDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserProfileDataStruct &&
        uid == other.uid &&
        photoUrl == other.photoUrl &&
        displayName == other.displayName &&
        userAffiliation == other.userAffiliation &&
        userResearchField == other.userResearchField &&
        userRequiredResources == other.userRequiredResources &&
        userType == other.userType &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([
        uid,
        photoUrl,
        displayName,
        userAffiliation,
        userResearchField,
        userRequiredResources,
        userType,
        phoneNumber
      ]);
}

UserProfileDataStruct createUserProfileDataStruct({
  String? uid,
  String? photoUrl,
  String? displayName,
  String? userAffiliation,
  String? userResearchField,
  String? userRequiredResources,
  String? userType,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserProfileDataStruct(
      uid: uid,
      photoUrl: photoUrl,
      displayName: displayName,
      userAffiliation: userAffiliation,
      userResearchField: userResearchField,
      userRequiredResources: userRequiredResources,
      userType: userType,
      phoneNumber: phoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserProfileDataStruct? updateUserProfileDataStruct(
  UserProfileDataStruct? userProfileData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userProfileData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserProfileDataStructData(
  Map<String, dynamic> firestoreData,
  UserProfileDataStruct? userProfileData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userProfileData == null) {
    return;
  }
  if (userProfileData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userProfileData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userProfileDataData =
      getUserProfileDataFirestoreData(userProfileData, forFieldValue);
  final nestedData =
      userProfileDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userProfileData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserProfileDataFirestoreData(
  UserProfileDataStruct? userProfileData, [
  bool forFieldValue = false,
]) {
  if (userProfileData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userProfileData.toMap());

  // Add any Firestore field values
  userProfileData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserProfileDataListFirestoreData(
  List<UserProfileDataStruct>? userProfileDatas,
) =>
    userProfileDatas
        ?.map((e) => getUserProfileDataFirestoreData(e, true))
        .toList() ??
    [];
