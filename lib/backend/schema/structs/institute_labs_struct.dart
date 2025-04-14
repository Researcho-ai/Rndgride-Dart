// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InstituteLabsStruct extends FFFirebaseStruct {
  InstituteLabsStruct({
    String? labInchargeName,
    String? labEmail,
    DocumentReference? labRef,
    int? createdTime,
    bool? isAccessByAdmin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _labInchargeName = labInchargeName,
        _labEmail = labEmail,
        _labRef = labRef,
        _createdTime = createdTime,
        _isAccessByAdmin = isAccessByAdmin,
        super(firestoreUtilData);

  // "lab_incharge_name" field.
  String? _labInchargeName;
  String get labInchargeName => _labInchargeName ?? '';
  set labInchargeName(String? val) => _labInchargeName = val;

  bool hasLabInchargeName() => _labInchargeName != null;

  // "lab_email" field.
  String? _labEmail;
  String get labEmail => _labEmail ?? '';
  set labEmail(String? val) => _labEmail = val;

  bool hasLabEmail() => _labEmail != null;

  // "lab_ref" field.
  DocumentReference? _labRef;
  DocumentReference? get labRef => _labRef;
  set labRef(DocumentReference? val) => _labRef = val;

  bool hasLabRef() => _labRef != null;

  // "createdTime" field.
  int? _createdTime;
  int get createdTime => _createdTime ?? 0;
  set createdTime(int? val) => _createdTime = val;

  void incrementCreatedTime(int amount) => createdTime = createdTime + amount;

  bool hasCreatedTime() => _createdTime != null;

  // "isAccessByAdmin" field.
  bool? _isAccessByAdmin;
  bool get isAccessByAdmin => _isAccessByAdmin ?? false;
  set isAccessByAdmin(bool? val) => _isAccessByAdmin = val;

  bool hasIsAccessByAdmin() => _isAccessByAdmin != null;

  static InstituteLabsStruct fromMap(Map<String, dynamic> data) =>
      InstituteLabsStruct(
        labInchargeName: data['lab_incharge_name'] as String?,
        labEmail: data['lab_email'] as String?,
        labRef: data['lab_ref'] as DocumentReference?,
        createdTime: castToType<int>(data['createdTime']),
        isAccessByAdmin: data['isAccessByAdmin'] as bool?,
      );

  static InstituteLabsStruct? maybeFromMap(dynamic data) => data is Map
      ? InstituteLabsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'lab_incharge_name': _labInchargeName,
        'lab_email': _labEmail,
        'lab_ref': _labRef,
        'createdTime': _createdTime,
        'isAccessByAdmin': _isAccessByAdmin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lab_incharge_name': serializeParam(
          _labInchargeName,
          ParamType.String,
        ),
        'lab_email': serializeParam(
          _labEmail,
          ParamType.String,
        ),
        'lab_ref': serializeParam(
          _labRef,
          ParamType.DocumentReference,
        ),
        'createdTime': serializeParam(
          _createdTime,
          ParamType.int,
        ),
        'isAccessByAdmin': serializeParam(
          _isAccessByAdmin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static InstituteLabsStruct fromSerializableMap(Map<String, dynamic> data) =>
      InstituteLabsStruct(
        labInchargeName: deserializeParam(
          data['lab_incharge_name'],
          ParamType.String,
          false,
        ),
        labEmail: deserializeParam(
          data['lab_email'],
          ParamType.String,
          false,
        ),
        labRef: deserializeParam(
          data['lab_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['labs'],
        ),
        createdTime: deserializeParam(
          data['createdTime'],
          ParamType.int,
          false,
        ),
        isAccessByAdmin: deserializeParam(
          data['isAccessByAdmin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'InstituteLabsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstituteLabsStruct &&
        labInchargeName == other.labInchargeName &&
        labEmail == other.labEmail &&
        labRef == other.labRef &&
        createdTime == other.createdTime &&
        isAccessByAdmin == other.isAccessByAdmin;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([labInchargeName, labEmail, labRef, createdTime, isAccessByAdmin]);
}

InstituteLabsStruct createInstituteLabsStruct({
  String? labInchargeName,
  String? labEmail,
  DocumentReference? labRef,
  int? createdTime,
  bool? isAccessByAdmin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstituteLabsStruct(
      labInchargeName: labInchargeName,
      labEmail: labEmail,
      labRef: labRef,
      createdTime: createdTime,
      isAccessByAdmin: isAccessByAdmin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstituteLabsStruct? updateInstituteLabsStruct(
  InstituteLabsStruct? instituteLabs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    instituteLabs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstituteLabsStructData(
  Map<String, dynamic> firestoreData,
  InstituteLabsStruct? instituteLabs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (instituteLabs == null) {
    return;
  }
  if (instituteLabs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && instituteLabs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final instituteLabsData =
      getInstituteLabsFirestoreData(instituteLabs, forFieldValue);
  final nestedData =
      instituteLabsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = instituteLabs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstituteLabsFirestoreData(
  InstituteLabsStruct? instituteLabs, [
  bool forFieldValue = false,
]) {
  if (instituteLabs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(instituteLabs.toMap());

  // Add any Firestore field values
  instituteLabs.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstituteLabsListFirestoreData(
  List<InstituteLabsStruct>? instituteLabss,
) =>
    instituteLabss
        ?.map((e) => getInstituteLabsFirestoreData(e, true))
        .toList() ??
    [];
