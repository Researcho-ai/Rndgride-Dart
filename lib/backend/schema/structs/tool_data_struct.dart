// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolDataStruct extends FFFirebaseStruct {
  ToolDataStruct({
    String? toolID,
    String? toolName,
    String? toolDescription,
    String? toolImage,
    String? toolURL,
    int? likesCount,
    List<String>? likesCountArray,
    String? visitorsCount,
    String? commentCount,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _toolID = toolID,
        _toolName = toolName,
        _toolDescription = toolDescription,
        _toolImage = toolImage,
        _toolURL = toolURL,
        _likesCount = likesCount,
        _likesCountArray = likesCountArray,
        _visitorsCount = visitorsCount,
        _commentCount = commentCount,
        super(firestoreUtilData);

  // "toolID" field.
  String? _toolID;
  String get toolID => _toolID ?? '';
  set toolID(String? val) => _toolID = val;

  bool hasToolID() => _toolID != null;

  // "toolName" field.
  String? _toolName;
  String get toolName => _toolName ?? '';
  set toolName(String? val) => _toolName = val;

  bool hasToolName() => _toolName != null;

  // "toolDescription" field.
  String? _toolDescription;
  String get toolDescription => _toolDescription ?? '';
  set toolDescription(String? val) => _toolDescription = val;

  bool hasToolDescription() => _toolDescription != null;

  // "toolImage" field.
  String? _toolImage;
  String get toolImage => _toolImage ?? '';
  set toolImage(String? val) => _toolImage = val;

  bool hasToolImage() => _toolImage != null;

  // "toolURL" field.
  String? _toolURL;
  String get toolURL => _toolURL ?? '';
  set toolURL(String? val) => _toolURL = val;

  bool hasToolURL() => _toolURL != null;

  // "likesCount" field.
  int? _likesCount;
  int get likesCount => _likesCount ?? 0;
  set likesCount(int? val) => _likesCount = val;

  void incrementLikesCount(int amount) => likesCount = likesCount + amount;

  bool hasLikesCount() => _likesCount != null;

  // "likesCountArray" field.
  List<String>? _likesCountArray;
  List<String> get likesCountArray => _likesCountArray ?? const [];
  set likesCountArray(List<String>? val) => _likesCountArray = val;

  void updateLikesCountArray(Function(List<String>) updateFn) {
    updateFn(_likesCountArray ??= []);
  }

  bool hasLikesCountArray() => _likesCountArray != null;

  // "visitorsCount" field.
  String? _visitorsCount;
  String get visitorsCount => _visitorsCount ?? '';
  set visitorsCount(String? val) => _visitorsCount = val;

  bool hasVisitorsCount() => _visitorsCount != null;

  // "commentCount" field.
  String? _commentCount;
  String get commentCount => _commentCount ?? '';
  set commentCount(String? val) => _commentCount = val;

  bool hasCommentCount() => _commentCount != null;

  static ToolDataStruct fromMap(Map<String, dynamic> data) => ToolDataStruct(
        toolID: data['toolID'] as String?,
        toolName: data['toolName'] as String?,
        toolDescription: data['toolDescription'] as String?,
        toolImage: data['toolImage'] as String?,
        toolURL: data['toolURL'] as String?,
        likesCount: castToType<int>(data['likesCount']),
        likesCountArray: getDataList(data['likesCountArray']),
        visitorsCount: data['visitorsCount'] as String?,
        commentCount: data['commentCount'] as String?,
      );

  static ToolDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? ToolDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'toolID': _toolID,
        'toolName': _toolName,
        'toolDescription': _toolDescription,
        'toolImage': _toolImage,
        'toolURL': _toolURL,
        'likesCount': _likesCount,
        'likesCountArray': _likesCountArray,
        'visitorsCount': _visitorsCount,
        'commentCount': _commentCount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'toolID': serializeParam(
          _toolID,
          ParamType.String,
        ),
        'toolName': serializeParam(
          _toolName,
          ParamType.String,
        ),
        'toolDescription': serializeParam(
          _toolDescription,
          ParamType.String,
        ),
        'toolImage': serializeParam(
          _toolImage,
          ParamType.String,
        ),
        'toolURL': serializeParam(
          _toolURL,
          ParamType.String,
        ),
        'likesCount': serializeParam(
          _likesCount,
          ParamType.int,
        ),
        'likesCountArray': serializeParam(
          _likesCountArray,
          ParamType.String,
          isList: true,
        ),
        'visitorsCount': serializeParam(
          _visitorsCount,
          ParamType.String,
        ),
        'commentCount': serializeParam(
          _commentCount,
          ParamType.String,
        ),
      }.withoutNulls;

  static ToolDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ToolDataStruct(
        toolID: deserializeParam(
          data['toolID'],
          ParamType.String,
          false,
        ),
        toolName: deserializeParam(
          data['toolName'],
          ParamType.String,
          false,
        ),
        toolDescription: deserializeParam(
          data['toolDescription'],
          ParamType.String,
          false,
        ),
        toolImage: deserializeParam(
          data['toolImage'],
          ParamType.String,
          false,
        ),
        toolURL: deserializeParam(
          data['toolURL'],
          ParamType.String,
          false,
        ),
        likesCount: deserializeParam(
          data['likesCount'],
          ParamType.int,
          false,
        ),
        likesCountArray: deserializeParam<String>(
          data['likesCountArray'],
          ParamType.String,
          true,
        ),
        visitorsCount: deserializeParam(
          data['visitorsCount'],
          ParamType.String,
          false,
        ),
        commentCount: deserializeParam(
          data['commentCount'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ToolDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ToolDataStruct &&
        toolID == other.toolID &&
        toolName == other.toolName &&
        toolDescription == other.toolDescription &&
        toolImage == other.toolImage &&
        toolURL == other.toolURL &&
        likesCount == other.likesCount &&
        listEquality.equals(likesCountArray, other.likesCountArray) &&
        visitorsCount == other.visitorsCount &&
        commentCount == other.commentCount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        toolID,
        toolName,
        toolDescription,
        toolImage,
        toolURL,
        likesCount,
        likesCountArray,
        visitorsCount,
        commentCount
      ]);
}

ToolDataStruct createToolDataStruct({
  String? toolID,
  String? toolName,
  String? toolDescription,
  String? toolImage,
  String? toolURL,
  int? likesCount,
  String? visitorsCount,
  String? commentCount,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ToolDataStruct(
      toolID: toolID,
      toolName: toolName,
      toolDescription: toolDescription,
      toolImage: toolImage,
      toolURL: toolURL,
      likesCount: likesCount,
      visitorsCount: visitorsCount,
      commentCount: commentCount,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ToolDataStruct? updateToolDataStruct(
  ToolDataStruct? toolData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    toolData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addToolDataStructData(
  Map<String, dynamic> firestoreData,
  ToolDataStruct? toolData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (toolData == null) {
    return;
  }
  if (toolData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && toolData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final toolDataData = getToolDataFirestoreData(toolData, forFieldValue);
  final nestedData = toolDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = toolData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getToolDataFirestoreData(
  ToolDataStruct? toolData, [
  bool forFieldValue = false,
]) {
  if (toolData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(toolData.toMap());

  // Add any Firestore field values
  toolData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getToolDataListFirestoreData(
  List<ToolDataStruct>? toolDatas,
) =>
    toolDatas?.map((e) => getToolDataFirestoreData(e, true)).toList() ?? [];
