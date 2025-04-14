import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SophisticatedInstrumentsRecord extends FirestoreRecord {
  SophisticatedInstrumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "instrument_test_name" field.
  String? _instrumentTestName;
  String get instrumentTestName => _instrumentTestName ?? '';
  bool hasInstrumentTestName() => _instrumentTestName != null;

  // "light_imge_path" field.
  String? _lightImgePath;
  String get lightImgePath => _lightImgePath ?? '';
  bool hasLightImgePath() => _lightImgePath != null;

  // "dark_image_path" field.
  String? _darkImagePath;
  String get darkImagePath => _darkImagePath ?? '';
  bool hasDarkImagePath() => _darkImagePath != null;

  void _initializeFields() {
    _instrumentTestName = snapshotData['instrument_test_name'] as String?;
    _lightImgePath = snapshotData['light_imge_path'] as String?;
    _darkImagePath = snapshotData['dark_image_path'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sophisticated_instruments');

  static Stream<SophisticatedInstrumentsRecord> getDocument(
          DocumentReference ref) =>
      ref
          .snapshots()
          .map((s) => SophisticatedInstrumentsRecord.fromSnapshot(s));

  static Future<SophisticatedInstrumentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SophisticatedInstrumentsRecord.fromSnapshot(s));

  static SophisticatedInstrumentsRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SophisticatedInstrumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SophisticatedInstrumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SophisticatedInstrumentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SophisticatedInstrumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SophisticatedInstrumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSophisticatedInstrumentsRecordData({
  String? instrumentTestName,
  String? lightImgePath,
  String? darkImagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'instrument_test_name': instrumentTestName,
      'light_imge_path': lightImgePath,
      'dark_image_path': darkImagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class SophisticatedInstrumentsRecordDocumentEquality
    implements Equality<SophisticatedInstrumentsRecord> {
  const SophisticatedInstrumentsRecordDocumentEquality();

  @override
  bool equals(
      SophisticatedInstrumentsRecord? e1, SophisticatedInstrumentsRecord? e2) {
    return e1?.instrumentTestName == e2?.instrumentTestName &&
        e1?.lightImgePath == e2?.lightImgePath &&
        e1?.darkImagePath == e2?.darkImagePath;
  }

  @override
  int hash(SophisticatedInstrumentsRecord? e) => const ListEquality()
      .hash([e?.instrumentTestName, e?.lightImgePath, e?.darkImagePath]);

  @override
  bool isValidKey(Object? o) => o is SophisticatedInstrumentsRecord;
}
