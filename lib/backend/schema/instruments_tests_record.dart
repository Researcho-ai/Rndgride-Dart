import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstrumentsTestsRecord extends FirestoreRecord {
  InstrumentsTestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "instrument_test_name" field.
  String? _instrumentTestName;
  String get instrumentTestName => _instrumentTestName ?? '';
  bool hasInstrumentTestName() => _instrumentTestName != null;

  // "instrument_calibration_report" field.
  String? _instrumentCalibrationReport;
  String get instrumentCalibrationReport => _instrumentCalibrationReport ?? '';
  bool hasInstrumentCalibrationReport() => _instrumentCalibrationReport != null;

  // "is_instrument_calibrated" field.
  bool? _isInstrumentCalibrated;
  bool get isInstrumentCalibrated => _isInstrumentCalibrated ?? false;
  bool hasIsInstrumentCalibrated() => _isInstrumentCalibrated != null;

  // "is_instrument_active" field.
  bool? _isInstrumentActive;
  bool get isInstrumentActive => _isInstrumentActive ?? false;
  bool hasIsInstrumentActive() => _isInstrumentActive != null;

  // "instrument_make_model" field.
  String? _instrumentMakeModel;
  String get instrumentMakeModel => _instrumentMakeModel ?? '';
  bool hasInstrumentMakeModel() => _instrumentMakeModel != null;

  // "is_sophisticated" field.
  bool? _isSophisticated;
  bool get isSophisticated => _isSophisticated ?? false;
  bool hasIsSophisticated() => _isSophisticated != null;

  // "instrument_properties" field.
  List<InstrumentPropertiesStruct>? _instrumentProperties;
  List<InstrumentPropertiesStruct> get instrumentProperties =>
      _instrumentProperties ?? const [];
  bool hasInstrumentProperties() => _instrumentProperties != null;

  // "instruments_tests_list_ref" field.
  DocumentReference? _instrumentsTestsListRef;
  DocumentReference? get instrumentsTestsListRef => _instrumentsTestsListRef;
  bool hasInstrumentsTestsListRef() => _instrumentsTestsListRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _instrumentTestName = snapshotData['instrument_test_name'] as String?;
    _instrumentCalibrationReport =
        snapshotData['instrument_calibration_report'] as String?;
    _isInstrumentCalibrated = snapshotData['is_instrument_calibrated'] as bool?;
    _isInstrumentActive = snapshotData['is_instrument_active'] as bool?;
    _instrumentMakeModel = snapshotData['instrument_make_model'] as String?;
    _isSophisticated = snapshotData['is_sophisticated'] as bool?;
    _instrumentProperties = getStructList(
      snapshotData['instrument_properties'],
      InstrumentPropertiesStruct.fromMap,
    );
    _instrumentsTestsListRef =
        snapshotData['instruments_tests_list_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('instruments_tests')
          : FirebaseFirestore.instance.collectionGroup('instruments_tests');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('instruments_tests').doc(id);

  static Stream<InstrumentsTestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstrumentsTestsRecord.fromSnapshot(s));

  static Future<InstrumentsTestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InstrumentsTestsRecord.fromSnapshot(s));

  static InstrumentsTestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstrumentsTestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstrumentsTestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstrumentsTestsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstrumentsTestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstrumentsTestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstrumentsTestsRecordData({
  DateTime? createdTime,
  String? instrumentTestName,
  String? instrumentCalibrationReport,
  bool? isInstrumentCalibrated,
  bool? isInstrumentActive,
  String? instrumentMakeModel,
  bool? isSophisticated,
  DocumentReference? instrumentsTestsListRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'instrument_test_name': instrumentTestName,
      'instrument_calibration_report': instrumentCalibrationReport,
      'is_instrument_calibrated': isInstrumentCalibrated,
      'is_instrument_active': isInstrumentActive,
      'instrument_make_model': instrumentMakeModel,
      'is_sophisticated': isSophisticated,
      'instruments_tests_list_ref': instrumentsTestsListRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstrumentsTestsRecordDocumentEquality
    implements Equality<InstrumentsTestsRecord> {
  const InstrumentsTestsRecordDocumentEquality();

  @override
  bool equals(InstrumentsTestsRecord? e1, InstrumentsTestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.instrumentTestName == e2?.instrumentTestName &&
        e1?.instrumentCalibrationReport == e2?.instrumentCalibrationReport &&
        e1?.isInstrumentCalibrated == e2?.isInstrumentCalibrated &&
        e1?.isInstrumentActive == e2?.isInstrumentActive &&
        e1?.instrumentMakeModel == e2?.instrumentMakeModel &&
        e1?.isSophisticated == e2?.isSophisticated &&
        listEquality.equals(
            e1?.instrumentProperties, e2?.instrumentProperties) &&
        e1?.instrumentsTestsListRef == e2?.instrumentsTestsListRef;
  }

  @override
  int hash(InstrumentsTestsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.instrumentTestName,
        e?.instrumentCalibrationReport,
        e?.isInstrumentCalibrated,
        e?.isInstrumentActive,
        e?.instrumentMakeModel,
        e?.isSophisticated,
        e?.instrumentProperties,
        e?.instrumentsTestsListRef
      ]);

  @override
  bool isValidKey(Object? o) => o is InstrumentsTestsRecord;
}
