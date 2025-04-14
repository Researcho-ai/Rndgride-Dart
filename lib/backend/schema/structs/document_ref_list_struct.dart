// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DocumentRefListStruct extends FFFirebaseStruct {
  DocumentRefListStruct({
    DocumentReference? instrumentTestRef,
    DocumentReference? instrumentTestListRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _instrumentTestRef = instrumentTestRef,
        _instrumentTestListRef = instrumentTestListRef,
        super(firestoreUtilData);

  // "instrument_test_ref" field.
  DocumentReference? _instrumentTestRef;
  DocumentReference? get instrumentTestRef => _instrumentTestRef;
  set instrumentTestRef(DocumentReference? val) => _instrumentTestRef = val;

  bool hasInstrumentTestRef() => _instrumentTestRef != null;

  // "instrument_test_list_ref" field.
  DocumentReference? _instrumentTestListRef;
  DocumentReference? get instrumentTestListRef => _instrumentTestListRef;
  set instrumentTestListRef(DocumentReference? val) =>
      _instrumentTestListRef = val;

  bool hasInstrumentTestListRef() => _instrumentTestListRef != null;

  static DocumentRefListStruct fromMap(Map<String, dynamic> data) =>
      DocumentRefListStruct(
        instrumentTestRef: data['instrument_test_ref'] as DocumentReference?,
        instrumentTestListRef:
            data['instrument_test_list_ref'] as DocumentReference?,
      );

  static DocumentRefListStruct? maybeFromMap(dynamic data) => data is Map
      ? DocumentRefListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'instrument_test_ref': _instrumentTestRef,
        'instrument_test_list_ref': _instrumentTestListRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'instrument_test_ref': serializeParam(
          _instrumentTestRef,
          ParamType.DocumentReference,
        ),
        'instrument_test_list_ref': serializeParam(
          _instrumentTestListRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static DocumentRefListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DocumentRefListStruct(
        instrumentTestRef: deserializeParam(
          data['instrument_test_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['labs', 'instruments_tests'],
        ),
        instrumentTestListRef: deserializeParam(
          data['instrument_test_list_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['instruments_tests_list'],
        ),
      );

  @override
  String toString() => 'DocumentRefListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DocumentRefListStruct &&
        instrumentTestRef == other.instrumentTestRef &&
        instrumentTestListRef == other.instrumentTestListRef;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([instrumentTestRef, instrumentTestListRef]);
}

DocumentRefListStruct createDocumentRefListStruct({
  DocumentReference? instrumentTestRef,
  DocumentReference? instrumentTestListRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DocumentRefListStruct(
      instrumentTestRef: instrumentTestRef,
      instrumentTestListRef: instrumentTestListRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DocumentRefListStruct? updateDocumentRefListStruct(
  DocumentRefListStruct? documentRefList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    documentRefList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDocumentRefListStructData(
  Map<String, dynamic> firestoreData,
  DocumentRefListStruct? documentRefList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (documentRefList == null) {
    return;
  }
  if (documentRefList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && documentRefList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final documentRefListData =
      getDocumentRefListFirestoreData(documentRefList, forFieldValue);
  final nestedData =
      documentRefListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = documentRefList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDocumentRefListFirestoreData(
  DocumentRefListStruct? documentRefList, [
  bool forFieldValue = false,
]) {
  if (documentRefList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(documentRefList.toMap());

  // Add any Firestore field values
  documentRefList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDocumentRefListListFirestoreData(
  List<DocumentRefListStruct>? documentRefLists,
) =>
    documentRefLists
        ?.map((e) => getDocumentRefListFirestoreData(e, true))
        .toList() ??
    [];
