// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolsReplyStruct extends FFFirebaseStruct {
  ToolsReplyStruct({
    String? id,
    String? toolCommentId,
    String? mentionedId,
    String? reply,
    String? userRef,
    String? toolId,
    List<String>? likesList,
    String? mentionedUserName,
    String? userName,
    String? userType,
    String? userImage,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _toolCommentId = toolCommentId,
        _mentionedId = mentionedId,
        _reply = reply,
        _userRef = userRef,
        _toolId = toolId,
        _likesList = likesList,
        _mentionedUserName = mentionedUserName,
        _userName = userName,
        _userType = userType,
        _userImage = userImage,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "tool_comment_id" field.
  String? _toolCommentId;
  String get toolCommentId => _toolCommentId ?? '';
  set toolCommentId(String? val) => _toolCommentId = val;

  bool hasToolCommentId() => _toolCommentId != null;

  // "mentioned_id" field.
  String? _mentionedId;
  String get mentionedId => _mentionedId ?? '';
  set mentionedId(String? val) => _mentionedId = val;

  bool hasMentionedId() => _mentionedId != null;

  // "reply" field.
  String? _reply;
  String get reply => _reply ?? '';
  set reply(String? val) => _reply = val;

  bool hasReply() => _reply != null;

  // "user_ref" field.
  String? _userRef;
  String get userRef => _userRef ?? '';
  set userRef(String? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "tool_id" field.
  String? _toolId;
  String get toolId => _toolId ?? '';
  set toolId(String? val) => _toolId = val;

  bool hasToolId() => _toolId != null;

  // "likes_list" field.
  List<String>? _likesList;
  List<String> get likesList => _likesList ?? const [];
  set likesList(List<String>? val) => _likesList = val;

  void updateLikesList(Function(List<String>) updateFn) {
    updateFn(_likesList ??= []);
  }

  bool hasLikesList() => _likesList != null;

  // "mentioned_user_name" field.
  String? _mentionedUserName;
  String get mentionedUserName => _mentionedUserName ?? '';
  set mentionedUserName(String? val) => _mentionedUserName = val;

  bool hasMentionedUserName() => _mentionedUserName != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  set userType(String? val) => _userType = val;

  bool hasUserType() => _userType != null;

  // "user_image" field.
  String? _userImage;
  String get userImage => _userImage ?? '';
  set userImage(String? val) => _userImage = val;

  bool hasUserImage() => _userImage != null;

  static ToolsReplyStruct fromMap(Map<String, dynamic> data) =>
      ToolsReplyStruct(
        id: data['id'] as String?,
        toolCommentId: data['tool_comment_id'] as String?,
        mentionedId: data['mentioned_id'] as String?,
        reply: data['reply'] as String?,
        userRef: data['user_ref'] as String?,
        toolId: data['tool_id'] as String?,
        likesList: getDataList(data['likes_list']),
        mentionedUserName: data['mentioned_user_name'] as String?,
        userName: data['user_name'] as String?,
        userType: data['user_type'] as String?,
        userImage: data['user_image'] as String?,
      );

  static ToolsReplyStruct? maybeFromMap(dynamic data) => data is Map
      ? ToolsReplyStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'tool_comment_id': _toolCommentId,
        'mentioned_id': _mentionedId,
        'reply': _reply,
        'user_ref': _userRef,
        'tool_id': _toolId,
        'likes_list': _likesList,
        'mentioned_user_name': _mentionedUserName,
        'user_name': _userName,
        'user_type': _userType,
        'user_image': _userImage,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'tool_comment_id': serializeParam(
          _toolCommentId,
          ParamType.String,
        ),
        'mentioned_id': serializeParam(
          _mentionedId,
          ParamType.String,
        ),
        'reply': serializeParam(
          _reply,
          ParamType.String,
        ),
        'user_ref': serializeParam(
          _userRef,
          ParamType.String,
        ),
        'tool_id': serializeParam(
          _toolId,
          ParamType.String,
        ),
        'likes_list': serializeParam(
          _likesList,
          ParamType.String,
          isList: true,
        ),
        'mentioned_user_name': serializeParam(
          _mentionedUserName,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_type': serializeParam(
          _userType,
          ParamType.String,
        ),
        'user_image': serializeParam(
          _userImage,
          ParamType.String,
        ),
      }.withoutNulls;

  static ToolsReplyStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToolsReplyStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        toolCommentId: deserializeParam(
          data['tool_comment_id'],
          ParamType.String,
          false,
        ),
        mentionedId: deserializeParam(
          data['mentioned_id'],
          ParamType.String,
          false,
        ),
        reply: deserializeParam(
          data['reply'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.String,
          false,
        ),
        toolId: deserializeParam(
          data['tool_id'],
          ParamType.String,
          false,
        ),
        likesList: deserializeParam<String>(
          data['likes_list'],
          ParamType.String,
          true,
        ),
        mentionedUserName: deserializeParam(
          data['mentioned_user_name'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userType: deserializeParam(
          data['user_type'],
          ParamType.String,
          false,
        ),
        userImage: deserializeParam(
          data['user_image'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ToolsReplyStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ToolsReplyStruct &&
        id == other.id &&
        toolCommentId == other.toolCommentId &&
        mentionedId == other.mentionedId &&
        reply == other.reply &&
        userRef == other.userRef &&
        toolId == other.toolId &&
        listEquality.equals(likesList, other.likesList) &&
        mentionedUserName == other.mentionedUserName &&
        userName == other.userName &&
        userType == other.userType &&
        userImage == other.userImage;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        toolCommentId,
        mentionedId,
        reply,
        userRef,
        toolId,
        likesList,
        mentionedUserName,
        userName,
        userType,
        userImage
      ]);
}

ToolsReplyStruct createToolsReplyStruct({
  String? id,
  String? toolCommentId,
  String? mentionedId,
  String? reply,
  String? userRef,
  String? toolId,
  String? mentionedUserName,
  String? userName,
  String? userType,
  String? userImage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToolsReplyStruct(
      id: id,
      toolCommentId: toolCommentId,
      mentionedId: mentionedId,
      reply: reply,
      userRef: userRef,
      toolId: toolId,
      mentionedUserName: mentionedUserName,
      userName: userName,
      userType: userType,
      userImage: userImage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToolsReplyStruct? updateToolsReplyStruct(
  ToolsReplyStruct? toolsReply, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toolsReply
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToolsReplyStructData(
  Map<String, dynamic> firestoreData,
  ToolsReplyStruct? toolsReply,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toolsReply == null) {
    return;
  }
  if (toolsReply.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && toolsReply.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toolsReplyData = getToolsReplyFirestoreData(toolsReply, forFieldValue);
  final nestedData = toolsReplyData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toolsReply.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToolsReplyFirestoreData(
  ToolsReplyStruct? toolsReply, [
  bool forFieldValue = false,
]) {
  if (toolsReply == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toolsReply.toMap());

  // Add any Firestore field values
  toolsReply.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToolsReplyListFirestoreData(
  List<ToolsReplyStruct>? toolsReplys,
) =>
    toolsReplys?.map((e) => getToolsReplyFirestoreData(e, true)).toList() ?? [];
