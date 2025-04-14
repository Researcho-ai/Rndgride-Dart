// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InstrumentPropertiesStruct extends FFFirebaseStruct {
  InstrumentPropertiesStruct({
    String? academicPrice,
    String? internalPrice,
    String? industrialPrice,
    String? application,
    String? otherDetails,
    String? analysisName,
    String? solventMethodName,
    String? sampleQuantity,
    DocumentReference? instrumentRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _academicPrice = academicPrice,
        _internalPrice = internalPrice,
        _industrialPrice = industrialPrice,
        _application = application,
        _otherDetails = otherDetails,
        _analysisName = analysisName,
        _solventMethodName = solventMethodName,
        _sampleQuantity = sampleQuantity,
        _instrumentRef = instrumentRef,
        super(firestoreUtilData);

  // "academic_price" field.
  String? _academicPrice;
  String get academicPrice => _academicPrice ?? '';
  set academicPrice(String? val) => _academicPrice = val;

  bool hasAcademicPrice() => _academicPrice != null;

  // "internal_price" field.
  String? _internalPrice;
  String get internalPrice => _internalPrice ?? '';
  set internalPrice(String? val) => _internalPrice = val;

  bool hasInternalPrice() => _internalPrice != null;

  // "industrial_price" field.
  String? _industrialPrice;
  String get industrialPrice => _industrialPrice ?? '';
  set industrialPrice(String? val) => _industrialPrice = val;

  bool hasIndustrialPrice() => _industrialPrice != null;

  // "application" field.
  String? _application;
  String get application => _application ?? '';
  set application(String? val) => _application = val;

  bool hasApplication() => _application != null;

  // "other_details" field.
  String? _otherDetails;
  String get otherDetails => _otherDetails ?? '';
  set otherDetails(String? val) => _otherDetails = val;

  bool hasOtherDetails() => _otherDetails != null;

  // "analysis_name" field.
  String? _analysisName;
  String get analysisName => _analysisName ?? '';
  set analysisName(String? val) => _analysisName = val;

  bool hasAnalysisName() => _analysisName != null;

  // "solvent_method_name" field.
  String? _solventMethodName;
  String get solventMethodName => _solventMethodName ?? '';
  set solventMethodName(String? val) => _solventMethodName = val;

  bool hasSolventMethodName() => _solventMethodName != null;

  // "sample_quantity" field.
  String? _sampleQuantity;
  String get sampleQuantity => _sampleQuantity ?? '';
  set sampleQuantity(String? val) => _sampleQuantity = val;

  bool hasSampleQuantity() => _sampleQuantity != null;

  // "instrument_ref" field.
  DocumentReference? _instrumentRef;
  DocumentReference? get instrumentRef => _instrumentRef;
  set instrumentRef(DocumentReference? val) => _instrumentRef = val;

  bool hasInstrumentRef() => _instrumentRef != null;

  static InstrumentPropertiesStruct fromMap(Map<String, dynamic> data) =>
      InstrumentPropertiesStruct(
        academicPrice: data['academic_price'] as String?,
        internalPrice: data['internal_price'] as String?,
        industrialPrice: data['industrial_price'] as String?,
        application: data['application'] as String?,
        otherDetails: data['other_details'] as String?,
        analysisName: data['analysis_name'] as String?,
        solventMethodName: data['solvent_method_name'] as String?,
        sampleQuantity: data['sample_quantity'] as String?,
        instrumentRef: data['instrument_ref'] as DocumentReference?,
      );

  static InstrumentPropertiesStruct? maybeFromMap(dynamic data) => data is Map
      ? InstrumentPropertiesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'academic_price': _academicPrice,
        'internal_price': _internalPrice,
        'industrial_price': _industrialPrice,
        'application': _application,
        'other_details': _otherDetails,
        'analysis_name': _analysisName,
        'solvent_method_name': _solventMethodName,
        'sample_quantity': _sampleQuantity,
        'instrument_ref': _instrumentRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'academic_price': serializeParam(
          _academicPrice,
          ParamType.String,
        ),
        'internal_price': serializeParam(
          _internalPrice,
          ParamType.String,
        ),
        'industrial_price': serializeParam(
          _industrialPrice,
          ParamType.String,
        ),
        'application': serializeParam(
          _application,
          ParamType.String,
        ),
        'other_details': serializeParam(
          _otherDetails,
          ParamType.String,
        ),
        'analysis_name': serializeParam(
          _analysisName,
          ParamType.String,
        ),
        'solvent_method_name': serializeParam(
          _solventMethodName,
          ParamType.String,
        ),
        'sample_quantity': serializeParam(
          _sampleQuantity,
          ParamType.String,
        ),
        'instrument_ref': serializeParam(
          _instrumentRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static InstrumentPropertiesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstrumentPropertiesStruct(
        academicPrice: deserializeParam(
          data['academic_price'],
          ParamType.String,
          false,
        ),
        internalPrice: deserializeParam(
          data['internal_price'],
          ParamType.String,
          false,
        ),
        industrialPrice: deserializeParam(
          data['industrial_price'],
          ParamType.String,
          false,
        ),
        application: deserializeParam(
          data['application'],
          ParamType.String,
          false,
        ),
        otherDetails: deserializeParam(
          data['other_details'],
          ParamType.String,
          false,
        ),
        analysisName: deserializeParam(
          data['analysis_name'],
          ParamType.String,
          false,
        ),
        solventMethodName: deserializeParam(
          data['solvent_method_name'],
          ParamType.String,
          false,
        ),
        sampleQuantity: deserializeParam(
          data['sample_quantity'],
          ParamType.String,
          false,
        ),
        instrumentRef: deserializeParam(
          data['instrument_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['labs', 'instruments_tests'],
        ),
      );

  @override
  String toString() => 'InstrumentPropertiesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstrumentPropertiesStruct &&
        academicPrice == other.academicPrice &&
        internalPrice == other.internalPrice &&
        industrialPrice == other.industrialPrice &&
        application == other.application &&
        otherDetails == other.otherDetails &&
        analysisName == other.analysisName &&
        solventMethodName == other.solventMethodName &&
        sampleQuantity == other.sampleQuantity &&
        instrumentRef == other.instrumentRef;
  }

  @override
  int get hashCode => const ListEquality().hash([
        academicPrice,
        internalPrice,
        industrialPrice,
        application,
        otherDetails,
        analysisName,
        solventMethodName,
        sampleQuantity,
        instrumentRef
      ]);
}

InstrumentPropertiesStruct createInstrumentPropertiesStruct({
  String? academicPrice,
  String? internalPrice,
  String? industrialPrice,
  String? application,
  String? otherDetails,
  String? analysisName,
  String? solventMethodName,
  String? sampleQuantity,
  DocumentReference? instrumentRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstrumentPropertiesStruct(
      academicPrice: academicPrice,
      internalPrice: internalPrice,
      industrialPrice: industrialPrice,
      application: application,
      otherDetails: otherDetails,
      analysisName: analysisName,
      solventMethodName: solventMethodName,
      sampleQuantity: sampleQuantity,
      instrumentRef: instrumentRef,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstrumentPropertiesStruct? updateInstrumentPropertiesStruct(
  InstrumentPropertiesStruct? instrumentProperties, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    instrumentProperties
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstrumentPropertiesStructData(
  Map<String, dynamic> firestoreData,
  InstrumentPropertiesStruct? instrumentProperties,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (instrumentProperties == null) {
    return;
  }
  if (instrumentProperties.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && instrumentProperties.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final instrumentPropertiesData =
      getInstrumentPropertiesFirestoreData(instrumentProperties, forFieldValue);
  final nestedData =
      instrumentPropertiesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      instrumentProperties.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstrumentPropertiesFirestoreData(
  InstrumentPropertiesStruct? instrumentProperties, [
  bool forFieldValue = false,
]) {
  if (instrumentProperties == null) {
    return {};
  }
  final firestoreData = mapToFirestore(instrumentProperties.toMap());

  // Add any Firestore field values
  instrumentProperties.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstrumentPropertiesListFirestoreData(
  List<InstrumentPropertiesStruct>? instrumentPropertiess,
) =>
    instrumentPropertiess
        ?.map((e) => getInstrumentPropertiesFirestoreData(e, true))
        .toList() ??
    [];
