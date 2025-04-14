import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TermsRecord extends FirestoreRecord {
  TermsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "privacy_policy_researchers" field.
  TermsStruct? _privacyPolicyResearchers;
  TermsStruct get privacyPolicyResearchers =>
      _privacyPolicyResearchers ?? TermsStruct();
  bool hasPrivacyPolicyResearchers() => _privacyPolicyResearchers != null;

  // "terms_conditions_researchers" field.
  TermsStruct? _termsConditionsResearchers;
  TermsStruct get termsConditionsResearchers =>
      _termsConditionsResearchers ?? TermsStruct();
  bool hasTermsConditionsResearchers() => _termsConditionsResearchers != null;

  void _initializeFields() {
    _privacyPolicyResearchers = snapshotData['privacy_policy_researchers']
            is TermsStruct
        ? snapshotData['privacy_policy_researchers']
        : TermsStruct.maybeFromMap(snapshotData['privacy_policy_researchers']);
    _termsConditionsResearchers =
        snapshotData['terms_conditions_researchers'] is TermsStruct
            ? snapshotData['terms_conditions_researchers']
            : TermsStruct.maybeFromMap(
                snapshotData['terms_conditions_researchers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('terms');

  static Stream<TermsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TermsRecord.fromSnapshot(s));

  static Future<TermsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TermsRecord.fromSnapshot(s));

  static TermsRecord fromSnapshot(DocumentSnapshot snapshot) => TermsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TermsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TermsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TermsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TermsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTermsRecordData({
  TermsStruct? privacyPolicyResearchers,
  TermsStruct? termsConditionsResearchers,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'privacy_policy_researchers': TermsStruct().toMap(),
      'terms_conditions_researchers': TermsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "privacy_policy_researchers" field.
  addTermsStructData(
      firestoreData, privacyPolicyResearchers, 'privacy_policy_researchers');

  // Handle nested data for "terms_conditions_researchers" field.
  addTermsStructData(firestoreData, termsConditionsResearchers,
      'terms_conditions_researchers');

  return firestoreData;
}

class TermsRecordDocumentEquality implements Equality<TermsRecord> {
  const TermsRecordDocumentEquality();

  @override
  bool equals(TermsRecord? e1, TermsRecord? e2) {
    return e1?.privacyPolicyResearchers == e2?.privacyPolicyResearchers &&
        e1?.termsConditionsResearchers == e2?.termsConditionsResearchers;
  }

  @override
  int hash(TermsRecord? e) => const ListEquality()
      .hash([e?.privacyPolicyResearchers, e?.termsConditionsResearchers]);

  @override
  bool isValidKey(Object? o) => o is TermsRecord;
}
