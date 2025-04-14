// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SearchStruct extends FFFirebaseStruct {
  SearchStruct({
    List<DocumentReference>? lab,
    List<DocumentReference>? institutes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lab = lab,
        _institutes = institutes,
        super(firestoreUtilData);

  // "lab" field.
  List<DocumentReference>? _lab;
  List<DocumentReference> get lab => _lab ?? const [];
  set lab(List<DocumentReference>? val) => _lab = val;

  void updateLab(Function(List<DocumentReference>) updateFn) {
    updateFn(_lab ??= []);
  }

  bool hasLab() => _lab != null;

  // "institutes" field.
  List<DocumentReference>? _institutes;
  List<DocumentReference> get institutes => _institutes ?? const [];
  set institutes(List<DocumentReference>? val) => _institutes = val;

  void updateInstitutes(Function(List<DocumentReference>) updateFn) {
    updateFn(_institutes ??= []);
  }

  bool hasInstitutes() => _institutes != null;

  static SearchStruct fromMap(Map<String, dynamic> data) => SearchStruct(
        lab: getDataList(data['lab']),
        institutes: getDataList(data['institutes']),
      );

  static SearchStruct? maybeFromMap(dynamic data) =>
      data is Map ? SearchStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lab': _lab,
        'institutes': _institutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lab': serializeParam(
          _lab,
          ParamType.DocumentReference,
          isList: true,
        ),
        'institutes': serializeParam(
          _institutes,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static SearchStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchStruct(
        lab: deserializeParam<DocumentReference>(
          data['lab'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['labs'],
        ),
        institutes: deserializeParam<DocumentReference>(
          data['institutes'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['institutes'],
        ),
      );

  @override
  String toString() => 'SearchStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is SearchStruct &&
        listEquality.equals(lab, other.lab) &&
        listEquality.equals(institutes, other.institutes);
  }

  @override
  int get hashCode => const ListEquality().hash([lab, institutes]);
}

SearchStruct createSearchStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchStruct? updateSearchStruct(
  SearchStruct? search, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    search
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchStructData(
  Map<String, dynamic> firestoreData,
  SearchStruct? search,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (search == null) {
    return;
  }
  if (search.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && search.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchData = getSearchFirestoreData(search, forFieldValue);
  final nestedData = searchData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = search.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchFirestoreData(
  SearchStruct? search, [
  bool forFieldValue = false,
]) {
  if (search == null) {
    return {};
  }
  final firestoreData = mapToFirestore(search.toMap());

  // Add any Firestore field values
  search.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchListFirestoreData(
  List<SearchStruct>? searchs,
) =>
    searchs?.map((e) => getSearchFirestoreData(e, true)).toList() ?? [];
