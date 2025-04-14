// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TestAnalysisFieldAvaibilityStruct extends FFFirebaseStruct {
  TestAnalysisFieldAvaibilityStruct({
    bool? analysisPresent,
    bool? solventPresent,
    bool? subMaterialPresent,
    bool? testPresent,
    bool? testMethodPresent,
    bool? testRangePresent,
    bool? otherDetailPresent,
    bool? sampleQuantityPresent,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _analysisPresent = analysisPresent,
        _solventPresent = solventPresent,
        _subMaterialPresent = subMaterialPresent,
        _testPresent = testPresent,
        _testMethodPresent = testMethodPresent,
        _testRangePresent = testRangePresent,
        _otherDetailPresent = otherDetailPresent,
        _sampleQuantityPresent = sampleQuantityPresent,
        super(firestoreUtilData);

  // "analysis_present" field.
  bool? _analysisPresent;
  bool get analysisPresent => _analysisPresent ?? false;
  set analysisPresent(bool? val) => _analysisPresent = val;

  bool hasAnalysisPresent() => _analysisPresent != null;

  // "solvent_present" field.
  bool? _solventPresent;
  bool get solventPresent => _solventPresent ?? false;
  set solventPresent(bool? val) => _solventPresent = val;

  bool hasSolventPresent() => _solventPresent != null;

  // "sub_material_present" field.
  bool? _subMaterialPresent;
  bool get subMaterialPresent => _subMaterialPresent ?? false;
  set subMaterialPresent(bool? val) => _subMaterialPresent = val;

  bool hasSubMaterialPresent() => _subMaterialPresent != null;

  // "test_present" field.
  bool? _testPresent;
  bool get testPresent => _testPresent ?? false;
  set testPresent(bool? val) => _testPresent = val;

  bool hasTestPresent() => _testPresent != null;

  // "test_method_present" field.
  bool? _testMethodPresent;
  bool get testMethodPresent => _testMethodPresent ?? false;
  set testMethodPresent(bool? val) => _testMethodPresent = val;

  bool hasTestMethodPresent() => _testMethodPresent != null;

  // "test_range_present" field.
  bool? _testRangePresent;
  bool get testRangePresent => _testRangePresent ?? false;
  set testRangePresent(bool? val) => _testRangePresent = val;

  bool hasTestRangePresent() => _testRangePresent != null;

  // "other_detail_present" field.
  bool? _otherDetailPresent;
  bool get otherDetailPresent => _otherDetailPresent ?? false;
  set otherDetailPresent(bool? val) => _otherDetailPresent = val;

  bool hasOtherDetailPresent() => _otherDetailPresent != null;

  // "sample_quantity_present" field.
  bool? _sampleQuantityPresent;
  bool get sampleQuantityPresent => _sampleQuantityPresent ?? false;
  set sampleQuantityPresent(bool? val) => _sampleQuantityPresent = val;

  bool hasSampleQuantityPresent() => _sampleQuantityPresent != null;

  static TestAnalysisFieldAvaibilityStruct fromMap(Map<String, dynamic> data) =>
      TestAnalysisFieldAvaibilityStruct(
        analysisPresent: data['analysis_present'] as bool?,
        solventPresent: data['solvent_present'] as bool?,
        subMaterialPresent: data['sub_material_present'] as bool?,
        testPresent: data['test_present'] as bool?,
        testMethodPresent: data['test_method_present'] as bool?,
        testRangePresent: data['test_range_present'] as bool?,
        otherDetailPresent: data['other_detail_present'] as bool?,
        sampleQuantityPresent: data['sample_quantity_present'] as bool?,
      );

  static TestAnalysisFieldAvaibilityStruct? maybeFromMap(dynamic data) => data
          is Map
      ? TestAnalysisFieldAvaibilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'analysis_present': _analysisPresent,
        'solvent_present': _solventPresent,
        'sub_material_present': _subMaterialPresent,
        'test_present': _testPresent,
        'test_method_present': _testMethodPresent,
        'test_range_present': _testRangePresent,
        'other_detail_present': _otherDetailPresent,
        'sample_quantity_present': _sampleQuantityPresent,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'analysis_present': serializeParam(
          _analysisPresent,
          ParamType.bool,
        ),
        'solvent_present': serializeParam(
          _solventPresent,
          ParamType.bool,
        ),
        'sub_material_present': serializeParam(
          _subMaterialPresent,
          ParamType.bool,
        ),
        'test_present': serializeParam(
          _testPresent,
          ParamType.bool,
        ),
        'test_method_present': serializeParam(
          _testMethodPresent,
          ParamType.bool,
        ),
        'test_range_present': serializeParam(
          _testRangePresent,
          ParamType.bool,
        ),
        'other_detail_present': serializeParam(
          _otherDetailPresent,
          ParamType.bool,
        ),
        'sample_quantity_present': serializeParam(
          _sampleQuantityPresent,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TestAnalysisFieldAvaibilityStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TestAnalysisFieldAvaibilityStruct(
        analysisPresent: deserializeParam(
          data['analysis_present'],
          ParamType.bool,
          false,
        ),
        solventPresent: deserializeParam(
          data['solvent_present'],
          ParamType.bool,
          false,
        ),
        subMaterialPresent: deserializeParam(
          data['sub_material_present'],
          ParamType.bool,
          false,
        ),
        testPresent: deserializeParam(
          data['test_present'],
          ParamType.bool,
          false,
        ),
        testMethodPresent: deserializeParam(
          data['test_method_present'],
          ParamType.bool,
          false,
        ),
        testRangePresent: deserializeParam(
          data['test_range_present'],
          ParamType.bool,
          false,
        ),
        otherDetailPresent: deserializeParam(
          data['other_detail_present'],
          ParamType.bool,
          false,
        ),
        sampleQuantityPresent: deserializeParam(
          data['sample_quantity_present'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TestAnalysisFieldAvaibilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TestAnalysisFieldAvaibilityStruct &&
        analysisPresent == other.analysisPresent &&
        solventPresent == other.solventPresent &&
        subMaterialPresent == other.subMaterialPresent &&
        testPresent == other.testPresent &&
        testMethodPresent == other.testMethodPresent &&
        testRangePresent == other.testRangePresent &&
        otherDetailPresent == other.otherDetailPresent &&
        sampleQuantityPresent == other.sampleQuantityPresent;
  }

  @override
  int get hashCode => const ListEquality().hash([
        analysisPresent,
        solventPresent,
        subMaterialPresent,
        testPresent,
        testMethodPresent,
        testRangePresent,
        otherDetailPresent,
        sampleQuantityPresent
      ]);
}

TestAnalysisFieldAvaibilityStruct createTestAnalysisFieldAvaibilityStruct({
  bool? analysisPresent,
  bool? solventPresent,
  bool? subMaterialPresent,
  bool? testPresent,
  bool? testMethodPresent,
  bool? testRangePresent,
  bool? otherDetailPresent,
  bool? sampleQuantityPresent,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestAnalysisFieldAvaibilityStruct(
      analysisPresent: analysisPresent,
      solventPresent: solventPresent,
      subMaterialPresent: subMaterialPresent,
      testPresent: testPresent,
      testMethodPresent: testMethodPresent,
      testRangePresent: testRangePresent,
      otherDetailPresent: otherDetailPresent,
      sampleQuantityPresent: sampleQuantityPresent,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TestAnalysisFieldAvaibilityStruct? updateTestAnalysisFieldAvaibilityStruct(
  TestAnalysisFieldAvaibilityStruct? testAnalysisFieldAvaibility, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    testAnalysisFieldAvaibility
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTestAnalysisFieldAvaibilityStructData(
  Map<String, dynamic> firestoreData,
  TestAnalysisFieldAvaibilityStruct? testAnalysisFieldAvaibility,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testAnalysisFieldAvaibility == null) {
    return;
  }
  if (testAnalysisFieldAvaibility.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      testAnalysisFieldAvaibility.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testAnalysisFieldAvaibilityData =
      getTestAnalysisFieldAvaibilityFirestoreData(
          testAnalysisFieldAvaibility, forFieldValue);
  final nestedData = testAnalysisFieldAvaibilityData
      .map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      testAnalysisFieldAvaibility.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTestAnalysisFieldAvaibilityFirestoreData(
  TestAnalysisFieldAvaibilityStruct? testAnalysisFieldAvaibility, [
  bool forFieldValue = false,
]) {
  if (testAnalysisFieldAvaibility == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testAnalysisFieldAvaibility.toMap());

  // Add any Firestore field values
  testAnalysisFieldAvaibility.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestAnalysisFieldAvaibilityListFirestoreData(
  List<TestAnalysisFieldAvaibilityStruct>? testAnalysisFieldAvaibilitys,
) =>
    testAnalysisFieldAvaibilitys
        ?.map((e) => getTestAnalysisFieldAvaibilityFirestoreData(e, true))
        .toList() ??
    [];
