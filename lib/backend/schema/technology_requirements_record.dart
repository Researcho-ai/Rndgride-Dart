import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TechnologyRequirementsRecord extends FirestoreRecord {
  TechnologyRequirementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "organization_name" field.
  String? _organizationName;
  String get organizationName => _organizationName ?? '';
  bool hasOrganizationName() => _organizationName != null;

  // "email_id" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "needed_technology" field.
  String? _neededTechnology;
  String get neededTechnology => _neededTechnology ?? '';
  bool hasNeededTechnology() => _neededTechnology != null;

  // "technology_sector" field.
  String? _technologySector;
  String get technologySector => _technologySector ?? '';
  bool hasTechnologySector() => _technologySector != null;

  // "expected_implementation_time" field.
  String? _expectedImplementationTime;
  String get expectedImplementationTime => _expectedImplementationTime ?? '';
  bool hasExpectedImplementationTime() => _expectedImplementationTime != null;

  // "allocated_budget" field.
  String? _allocatedBudget;
  String get allocatedBudget => _allocatedBudget ?? '';
  bool hasAllocatedBudget() => _allocatedBudget != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fullName = snapshotData['full_name'] as String?;
    _jobTitle = snapshotData['job_title'] as String?;
    _organizationName = snapshotData['organization_name'] as String?;
    _emailId = snapshotData['email_id'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _neededTechnology = snapshotData['needed_technology'] as String?;
    _technologySector = snapshotData['technology_sector'] as String?;
    _expectedImplementationTime =
        snapshotData['expected_implementation_time'] as String?;
    _allocatedBudget = snapshotData['allocated_budget'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('technology_requirements')
          : FirebaseFirestore.instance
              .collectionGroup('technology_requirements');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('technology_requirements').doc(id);

  static Stream<TechnologyRequirementsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TechnologyRequirementsRecord.fromSnapshot(s));

  static Future<TechnologyRequirementsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TechnologyRequirementsRecord.fromSnapshot(s));

  static TechnologyRequirementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TechnologyRequirementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TechnologyRequirementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TechnologyRequirementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TechnologyRequirementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TechnologyRequirementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTechnologyRequirementsRecordData({
  String? fullName,
  String? jobTitle,
  String? organizationName,
  String? emailId,
  String? phoneNumber,
  String? neededTechnology,
  String? technologySector,
  String? expectedImplementationTime,
  String? allocatedBudget,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'full_name': fullName,
      'job_title': jobTitle,
      'organization_name': organizationName,
      'email_id': emailId,
      'phone_number': phoneNumber,
      'needed_technology': neededTechnology,
      'technology_sector': technologySector,
      'expected_implementation_time': expectedImplementationTime,
      'allocated_budget': allocatedBudget,
    }.withoutNulls,
  );

  return firestoreData;
}

class TechnologyRequirementsRecordDocumentEquality
    implements Equality<TechnologyRequirementsRecord> {
  const TechnologyRequirementsRecordDocumentEquality();

  @override
  bool equals(
      TechnologyRequirementsRecord? e1, TechnologyRequirementsRecord? e2) {
    return e1?.fullName == e2?.fullName &&
        e1?.jobTitle == e2?.jobTitle &&
        e1?.organizationName == e2?.organizationName &&
        e1?.emailId == e2?.emailId &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.neededTechnology == e2?.neededTechnology &&
        e1?.technologySector == e2?.technologySector &&
        e1?.expectedImplementationTime == e2?.expectedImplementationTime &&
        e1?.allocatedBudget == e2?.allocatedBudget;
  }

  @override
  int hash(TechnologyRequirementsRecord? e) => const ListEquality().hash([
        e?.fullName,
        e?.jobTitle,
        e?.organizationName,
        e?.emailId,
        e?.phoneNumber,
        e?.neededTechnology,
        e?.technologySector,
        e?.expectedImplementationTime,
        e?.allocatedBudget
      ]);

  @override
  bool isValidKey(Object? o) => o is TechnologyRequirementsRecord;
}
