import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobsRecord extends FirestoreRecord {
  JobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "job_location" field.
  String? _jobLocation;
  String get jobLocation => _jobLocation ?? '';
  bool hasJobLocation() => _jobLocation != null;

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  bool hasField() => _field != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "required_skills" field.
  String? _requiredSkills;
  String get requiredSkills => _requiredSkills ?? '';
  bool hasRequiredSkills() => _requiredSkills != null;

  // "job_type_ref" field.
  DocumentReference? _jobTypeRef;
  DocumentReference? get jobTypeRef => _jobTypeRef;
  bool hasJobTypeRef() => _jobTypeRef != null;

  // "job_url" field.
  String? _jobUrl;
  String get jobUrl => _jobUrl ?? '';
  bool hasJobUrl() => _jobUrl != null;

  // "application_deadline" field.
  DateTime? _applicationDeadline;
  DateTime? get applicationDeadline => _applicationDeadline;
  bool hasApplicationDeadline() => _applicationDeadline != null;

  // "salary" field.
  String? _salary;
  String get salary => _salary ?? '';
  bool hasSalary() => _salary != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "benefits" field.
  String? _benefits;
  String get benefits => _benefits ?? '';
  bool hasBenefits() => _benefits != null;

  // "how_to_apply" field.
  String? _howToApply;
  String get howToApply => _howToApply ?? '';
  bool hasHowToApply() => _howToApply != null;

  // "visited_counter" field.
  int? _visitedCounter;
  int get visitedCounter => _visitedCounter ?? 0;
  bool hasVisitedCounter() => _visitedCounter != null;

  void _initializeFields() {
    _jobTitle = snapshotData['job_title'] as String?;
    _companyName = snapshotData['company_name'] as String?;
    _jobLocation = snapshotData['job_location'] as String?;
    _field = snapshotData['field'] as String?;
    _duration = snapshotData['duration'] as String?;
    _requiredSkills = snapshotData['required_skills'] as String?;
    _jobTypeRef = snapshotData['job_type_ref'] as DocumentReference?;
    _jobUrl = snapshotData['job_url'] as String?;
    _applicationDeadline = snapshotData['application_deadline'] as DateTime?;
    _salary = snapshotData['salary'] as String?;
    _description = snapshotData['description'] as String?;
    _benefits = snapshotData['benefits'] as String?;
    _howToApply = snapshotData['how_to_apply'] as String?;
    _visitedCounter = castToType<int>(snapshotData['visited_counter']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('jobs');

  static Stream<JobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobsRecord.fromSnapshot(s));

  static Future<JobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobsRecord.fromSnapshot(s));

  static JobsRecord fromSnapshot(DocumentSnapshot snapshot) => JobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobsRecordData({
  String? jobTitle,
  String? companyName,
  String? jobLocation,
  String? field,
  String? duration,
  String? requiredSkills,
  DocumentReference? jobTypeRef,
  String? jobUrl,
  DateTime? applicationDeadline,
  String? salary,
  String? description,
  String? benefits,
  String? howToApply,
  int? visitedCounter,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_title': jobTitle,
      'company_name': companyName,
      'job_location': jobLocation,
      'field': field,
      'duration': duration,
      'required_skills': requiredSkills,
      'job_type_ref': jobTypeRef,
      'job_url': jobUrl,
      'application_deadline': applicationDeadline,
      'salary': salary,
      'description': description,
      'benefits': benefits,
      'how_to_apply': howToApply,
      'visited_counter': visitedCounter,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobsRecordDocumentEquality implements Equality<JobsRecord> {
  const JobsRecordDocumentEquality();

  @override
  bool equals(JobsRecord? e1, JobsRecord? e2) {
    return e1?.jobTitle == e2?.jobTitle &&
        e1?.companyName == e2?.companyName &&
        e1?.jobLocation == e2?.jobLocation &&
        e1?.field == e2?.field &&
        e1?.duration == e2?.duration &&
        e1?.requiredSkills == e2?.requiredSkills &&
        e1?.jobTypeRef == e2?.jobTypeRef &&
        e1?.jobUrl == e2?.jobUrl &&
        e1?.applicationDeadline == e2?.applicationDeadline &&
        e1?.salary == e2?.salary &&
        e1?.description == e2?.description &&
        e1?.benefits == e2?.benefits &&
        e1?.howToApply == e2?.howToApply &&
        e1?.visitedCounter == e2?.visitedCounter;
  }

  @override
  int hash(JobsRecord? e) => const ListEquality().hash([
        e?.jobTitle,
        e?.companyName,
        e?.jobLocation,
        e?.field,
        e?.duration,
        e?.requiredSkills,
        e?.jobTypeRef,
        e?.jobUrl,
        e?.applicationDeadline,
        e?.salary,
        e?.description,
        e?.benefits,
        e?.howToApply,
        e?.visitedCounter
      ]);

  @override
  bool isValidKey(Object? o) => o is JobsRecord;
}
