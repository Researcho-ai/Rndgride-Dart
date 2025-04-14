// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserRequestsStruct extends FFFirebaseStruct {
  UserRequestsStruct({
    String? userRequest,
    bool? isUserRequestSeen,
    DateTime? timestamp,
    DocumentReference? userRefrence,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userRequest = userRequest,
        _isUserRequestSeen = isUserRequestSeen,
        _timestamp = timestamp,
        _userRefrence = userRefrence,
        super(firestoreUtilData);

  // "user_request" field.
  String? _userRequest;
  String get userRequest => _userRequest ?? '';
  set userRequest(String? val) => _userRequest = val;

  bool hasUserRequest() => _userRequest != null;

  // "is_user_request_seen" field.
  bool? _isUserRequestSeen;
  bool get isUserRequestSeen => _isUserRequestSeen ?? false;
  set isUserRequestSeen(bool? val) => _isUserRequestSeen = val;

  bool hasIsUserRequestSeen() => _isUserRequestSeen != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;

  bool hasTimestamp() => _timestamp != null;

  // "user_refrence" field.
  DocumentReference? _userRefrence;
  DocumentReference? get userRefrence => _userRefrence;
  set userRefrence(DocumentReference? val) => _userRefrence = val;

  bool hasUserRefrence() => _userRefrence != null;

  static UserRequestsStruct fromMap(Map<String, dynamic> data) =>
      UserRequestsStruct(
        userRequest: data['user_request'] as String?,
        isUserRequestSeen: data['is_user_request_seen'] as bool?,
        timestamp: data['timestamp'] as DateTime?,
        userRefrence: data['user_refrence'] as DocumentReference?,
      );

  static UserRequestsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserRequestsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_request': _userRequest,
        'is_user_request_seen': _isUserRequestSeen,
        'timestamp': _timestamp,
        'user_refrence': _userRefrence,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_request': serializeParam(
          _userRequest,
          ParamType.String,
        ),
        'is_user_request_seen': serializeParam(
          _isUserRequestSeen,
          ParamType.bool,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'user_refrence': serializeParam(
          _userRefrence,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static UserRequestsStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserRequestsStruct(
        userRequest: deserializeParam(
          data['user_request'],
          ParamType.String,
          false,
        ),
        isUserRequestSeen: deserializeParam(
          data['is_user_request_seen'],
          ParamType.bool,
          false,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        userRefrence: deserializeParam(
          data['user_refrence'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'UserRequestsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserRequestsStruct &&
        userRequest == other.userRequest &&
        isUserRequestSeen == other.isUserRequestSeen &&
        timestamp == other.timestamp &&
        userRefrence == other.userRefrence;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userRequest, isUserRequestSeen, timestamp, userRefrence]);
}

UserRequestsStruct createUserRequestsStruct({
  String? userRequest,
  bool? isUserRequestSeen,
  DateTime? timestamp,
  DocumentReference? userRefrence,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserRequestsStruct(
      userRequest: userRequest,
      isUserRequestSeen: isUserRequestSeen,
      timestamp: timestamp,
      userRefrence: userRefrence,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserRequestsStruct? updateUserRequestsStruct(
  UserRequestsStruct? userRequests, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userRequests
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserRequestsStructData(
  Map<String, dynamic> firestoreData,
  UserRequestsStruct? userRequests,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userRequests == null) {
    return;
  }
  if (userRequests.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userRequests.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userRequestsData =
      getUserRequestsFirestoreData(userRequests, forFieldValue);
  final nestedData =
      userRequestsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userRequests.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserRequestsFirestoreData(
  UserRequestsStruct? userRequests, [
  bool forFieldValue = false,
]) {
  if (userRequests == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userRequests.toMap());

  // Add any Firestore field values
  userRequests.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserRequestsListFirestoreData(
  List<UserRequestsStruct>? userRequestss,
) =>
    userRequestss?.map((e) => getUserRequestsFirestoreData(e, true)).toList() ??
    [];
