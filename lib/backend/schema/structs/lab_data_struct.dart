// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LabDataStruct extends FFFirebaseStruct {
  LabDataStruct({
    String? labName,
    String? instituteName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _labName = labName,
        _instituteName = instituteName,
        super(firestoreUtilData);

  // "lab_name" field.
  String? _labName;
  String get labName => _labName ?? '';
  set labName(String? val) => _labName = val;

  bool hasLabName() => _labName != null;

  // "institute_name" field.
  String? _instituteName;
  String get instituteName => _instituteName ?? '';
  set instituteName(String? val) => _instituteName = val;

  bool hasInstituteName() => _instituteName != null;

  static LabDataStruct fromMap(Map<String, dynamic> data) => LabDataStruct(
        labName: data['lab_name'] as String?,
        instituteName: data['institute_name'] as String?,
      );

  static LabDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? LabDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lab_name': _labName,
        'institute_name': _instituteName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lab_name': serializeParam(
          _labName,
          ParamType.String,
        ),
        'institute_name': serializeParam(
          _instituteName,
          ParamType.String,
        ),
      }.withoutNulls;

  static LabDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      LabDataStruct(
        labName: deserializeParam(
          data['lab_name'],
          ParamType.String,
          false,
        ),
        instituteName: deserializeParam(
          data['institute_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LabDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LabDataStruct &&
        labName == other.labName &&
        instituteName == other.instituteName;
  }

  @override
  int get hashCode => const ListEquality().hash([labName, instituteName]);
}

LabDataStruct createLabDataStruct({
  String? labName,
  String? instituteName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LabDataStruct(
      labName: labName,
      instituteName: instituteName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LabDataStruct? updateLabDataStruct(
  LabDataStruct? labData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    labData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLabDataStructData(
  Map<String, dynamic> firestoreData,
  LabDataStruct? labData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (labData == null) {
    return;
  }
  if (labData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && labData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final labDataData = getLabDataFirestoreData(labData, forFieldValue);
  final nestedData = labDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = labData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLabDataFirestoreData(
  LabDataStruct? labData, [
  bool forFieldValue = false,
]) {
  if (labData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(labData.toMap());

  // Add any Firestore field values
  labData.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLabDataListFirestoreData(
  List<LabDataStruct>? labDatas,
) =>
    labDatas?.map((e) => getLabDataFirestoreData(e, true)).toList() ?? [];
