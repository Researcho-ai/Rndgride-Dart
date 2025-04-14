// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolCommentDataStruct extends FFFirebaseStruct {
  ToolCommentDataStruct({
    String? toolCommentID,
    String? toolComment,
    String? userName,
    List<String>? upvoteCount,
    String? userType,
    String? toolID,
    String? userID,
    String? userImageURL,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _toolCommentID = toolCommentID,
        _toolComment = toolComment,
        _userName = userName,
        _upvoteCount = upvoteCount,
        _userType = userType,
        _toolID = toolID,
        _userID = userID,
        _userImageURL = userImageURL,
        super(firestoreUtilData);

  // "toolCommentID" field.
  String? _toolCommentID;
  String get toolCommentID => _toolCommentID ?? '';
  set toolCommentID(String? val) => _toolCommentID = val;

  bool hasToolCommentID() => _toolCommentID != null;

  // "toolComment" field.
  String? _toolComment;
  String get toolComment => _toolComment ?? '';
  set toolComment(String? val) => _toolComment = val;

  bool hasToolComment() => _toolComment != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "upvoteCount" field.
  List<String>? _upvoteCount;
  List<String> get upvoteCount => _upvoteCount ?? const [];
  set upvoteCount(List<String>? val) => _upvoteCount = val;

  void updateUpvoteCount(Function(List<String>) updateFn) {
    updateFn(_upvoteCount ??= []);
  }

  bool hasUpvoteCount() => _upvoteCount != null;

  // "userType" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "toolID" field.
  String? _toolID;
  String get toolID => _toolID ?? '';
  set toolID(String? val) => _toolID = val;

  bool hasToolID() => _toolID != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;

  bool hasUserID() => _userID != null;

  // "userImageURL" field.
  String? _userImageURL;
  String get userImageURL => _userImageURL ?? '';
  set userImageURL(String? val) => _userImageURL = val;

  bool hasUserImageURL() => _userImageURL != null;

  static ToolCommentDataStruct fromMap(Map<String, dynamic> data) =>
      ToolCommentDataStruct(
        toolCommentID: data['toolCommentID'] as String?,
        toolComment: data['toolComment'] as String?,
        userName: data['userName'] as String?,
        upvoteCount: getDataList(data['upvoteCount']),
        userType: data['userType'] as String?,
        toolID: data['toolID'] as String?,
        userID: data['userID'] as String?,
        userImageURL: data['userImageURL'] as String?,
      );

  static ToolCommentDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ToolCommentDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'toolCommentID': _toolCommentID,
        'toolComment': _toolComment,
        'userName': _userName,
        'upvoteCount': _upvoteCount,
        'userType': _userType,
        'toolID': _toolID,
        'userID': _userID,
        'userImageURL': _userImageURL,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'toolCommentID': serializeParam(
          _toolCommentID,
          ParamType.String,
        ),
        'toolComment': serializeParam(
          _toolComment,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'upvoteCount': serializeParam(
          _upvoteCount,
          ParamType.String,
          isList: true,
        ),
        'userType': serializeParam(
          _userType,
          ParamType.String,
        ),
        'toolID': serializeParam(
          _toolID,
          ParamType.String,
        ),
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'userImageURL': serializeParam(
          _userImageURL,
          ParamType.String,
        ),
      }.withoutNulls;

  static ToolCommentDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToolCommentDataStruct(
        toolCommentID: deserializeParam(
          data['toolCommentID'],
          ParamType.String,
          false,
        ),
        toolComment: deserializeParam(
          data['toolComment'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        upvoteCount: deserializeParam<String>(
          data['upvoteCount'],
          ParamType.String,
          true,
        ),
        userType: deserializeParam(
          data['userType'],
          ParamType.String,
          false,
        ),
        toolID: deserializeParam(
          data['toolID'],
          ParamType.String,
          false,
        ),
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        userImageURL: deserializeParam(
          data['userImageURL'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ToolCommentDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ToolCommentDataStruct &&
        toolCommentID == other.toolCommentID &&
        toolComment == other.toolComment &&
        userName == other.userName &&
        listEquality.equals(upvoteCount, other.upvoteCount) &&
        userType == other.userType &&
        toolID == other.toolID &&
        userID == other.userID &&
        userImageURL == other.userImageURL;
  }

  @override
  int get hashCode => const ListEquality().hash([
        toolCommentID,
        toolComment,
        userName,
        upvoteCount,
        userType,
        toolID,
        userID,
        userImageURL
      ]);
}

ToolCommentDataStruct createToolCommentDataStruct({
  String? toolCommentID,
  String? toolComment,
  String? userName,
  String? userType,
  String? toolID,
  String? userID,
  String? userImageURL,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToolCommentDataStruct(
      toolCommentID: toolCommentID,
      toolComment: toolComment,
      userName: userName,
      userType: userType,
      toolID: toolID,
      userID: userID,
      userImageURL: userImageURL,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToolCommentDataStruct? updateToolCommentDataStruct(
  ToolCommentDataStruct? toolCommentData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toolCommentData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToolCommentDataStructData(
  Map<String, dynamic> firestoreData,
  ToolCommentDataStruct? toolCommentData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toolCommentData == null) {
    return;
  }
  if (toolCommentData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && toolCommentData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toolCommentDataData =
      getToolCommentDataFirestoreData(toolCommentData, forFieldValue);
  final nestedData =
      toolCommentDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toolCommentData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToolCommentDataFirestoreData(
  ToolCommentDataStruct? toolCommentData, [
  bool forFieldValue = false,
]) {
  if (toolCommentData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toolCommentData.toMap());

  // Add any Firestore field values
  toolCommentData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToolCommentDataListFirestoreData(
  List<ToolCommentDataStruct>? toolCommentDatas,
) =>
    toolCommentDatas
        ?.map((e) => getToolCommentDataFirestoreData(e, true))
        .toList() ??
    [];
