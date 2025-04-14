// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TermsStruct extends FFFirebaseStruct {
  TermsStruct({
    String? header,
    DateTime? updatedDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _header = header,
        _updatedDate = updatedDate,
        super(firestoreUtilData);

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  set header(String? val) => _header = val;

  bool hasHeader() => _header != null;

  // "updated_date" field.
  DateTime? _updatedDate;
  DateTime? get updatedDate => _updatedDate;
  set updatedDate(DateTime? val) => _updatedDate = val;

  bool hasUpdatedDate() => _updatedDate != null;

  static TermsStruct fromMap(Map<String, dynamic> data) => TermsStruct(
        header: data['header'] as String?,
        updatedDate: data['updated_date'] as DateTime?,
      );

  static TermsStruct? maybeFromMap(dynamic data) =>
      data is Map ? TermsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'header': _header,
        'updated_date': _updatedDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'header': serializeParam(
          _header,
          ParamType.String,
        ),
        'updated_date': serializeParam(
          _updatedDate,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static TermsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TermsStruct(
        header: deserializeParam(
          data['header'],
          ParamType.String,
          false,
        ),
        updatedDate: deserializeParam(
          data['updated_date'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'TermsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TermsStruct &&
        header == other.header &&
        updatedDate == other.updatedDate;
  }

  @override
  int get hashCode => const ListEquality().hash([header, updatedDate]);
}

TermsStruct createTermsStruct({
  String? header,
  DateTime? updatedDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TermsStruct(
      header: header,
      updatedDate: updatedDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TermsStruct? updateTermsStruct(
  TermsStruct? terms, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    terms
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTermsStructData(
  Map<String, dynamic> firestoreData,
  TermsStruct? terms,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (terms == null) {
    return;
  }
  if (terms.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && terms.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final termsData = getTermsFirestoreData(terms, forFieldValue);
  final nestedData = termsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = terms.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTermsFirestoreData(
  TermsStruct? terms, [
  bool forFieldValue = false,
]) {
  if (terms == null) {
    return {};
  }
  final firestoreData = mapToFirestore(terms.toMap());

  // Add any Firestore field values
  terms.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTermsListFirestoreData(
  List<TermsStruct>? termss,
) =>
    termss?.map((e) => getTermsFirestoreData(e, true)).toList() ?? [];
