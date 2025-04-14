import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstrumentsTestsListRecord extends FirestoreRecord {
  InstrumentsTestsListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "instrument_test_name" field.
  String? _instrumentTestName;
  String get instrumentTestName => _instrumentTestName ?? '';
  bool hasInstrumentTestName() => _instrumentTestName != null;

  // "is_sophisticated" field.
  bool? _isSophisticated;
  bool get isSophisticated => _isSophisticated ?? false;
  bool hasIsSophisticated() => _isSophisticated != null;

  // "image_light" field.
  String? _imageLight;
  String get imageLight => _imageLight ?? '';
  bool hasImageLight() => _imageLight != null;

  // "image_dark" field.
  String? _imageDark;
  String get imageDark => _imageDark ?? '';
  bool hasImageDark() => _imageDark != null;

  void _initializeFields() {
    _instrumentTestName = snapshotData['instrument_test_name'] as String?;
    _isSophisticated = snapshotData['is_sophisticated'] as bool?;
    _imageLight = snapshotData['image_light'] as String?;
    _imageDark = snapshotData['image_dark'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('instruments_tests_list');

  static Stream<InstrumentsTestsListRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => InstrumentsTestsListRecord.fromSnapshot(s));

  static Future<InstrumentsTestsListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => InstrumentsTestsListRecord.fromSnapshot(s));

  static InstrumentsTestsListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstrumentsTestsListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstrumentsTestsListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstrumentsTestsListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstrumentsTestsListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstrumentsTestsListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstrumentsTestsListRecordData({
  String? instrumentTestName,
  bool? isSophisticated,
  String? imageLight,
  String? imageDark,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'instrument_test_name': instrumentTestName,
      'is_sophisticated': isSophisticated,
      'image_light': imageLight,
      'image_dark': imageDark,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstrumentsTestsListRecordDocumentEquality
    implements Equality<InstrumentsTestsListRecord> {
  const InstrumentsTestsListRecordDocumentEquality();

  @override
  bool equals(InstrumentsTestsListRecord? e1, InstrumentsTestsListRecord? e2) {
    return e1?.instrumentTestName == e2?.instrumentTestName &&
        e1?.isSophisticated == e2?.isSophisticated &&
        e1?.imageLight == e2?.imageLight &&
        e1?.imageDark == e2?.imageDark;
  }

  @override
  int hash(InstrumentsTestsListRecord? e) => const ListEquality().hash(
      [e?.instrumentTestName, e?.isSophisticated, e?.imageLight, e?.imageDark]);

  @override
  bool isValidKey(Object? o) => o is InstrumentsTestsListRecord;
}
