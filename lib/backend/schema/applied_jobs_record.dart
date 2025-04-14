import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppliedJobsRecord extends FirestoreRecord {
  AppliedJobsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "job_ref" field.
  DocumentReference? _jobRef;
  DocumentReference? get jobRef => _jobRef;
  bool hasJobRef() => _jobRef != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "is_application_viewed" field.
  bool? _isApplicationViewed;
  bool get isApplicationViewed => _isApplicationViewed ?? false;
  bool hasIsApplicationViewed() => _isApplicationViewed != null;

  // "is_interested" field.
  bool? _isInterested;
  bool get isInterested => _isInterested ?? false;
  bool hasIsInterested() => _isInterested != null;

  // "phone_no" field.
  String? _phoneNo;
  String get phoneNo => _phoneNo ?? '';
  bool hasPhoneNo() => _phoneNo != null;

  // "email_id" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  // "applicant_name" field.
  String? _applicantName;
  String get applicantName => _applicantName ?? '';
  bool hasApplicantName() => _applicantName != null;

  // "affliation" field.
  String? _affliation;
  String get affliation => _affliation ?? '';
  bool hasAffliation() => _affliation != null;

  // "institute" field.
  String? _institute;
  String get institute => _institute ?? '';
  bool hasInstitute() => _institute != null;

  // "resume_attachment" field.
  String? _resumeAttachment;
  String get resumeAttachment => _resumeAttachment ?? '';
  bool hasResumeAttachment() => _resumeAttachment != null;

  // "cv_attachment" field.
  String? _cvAttachment;
  String get cvAttachment => _cvAttachment ?? '';
  bool hasCvAttachment() => _cvAttachment != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _jobRef = snapshotData['job_ref'] as DocumentReference?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _isApplicationViewed = snapshotData['is_application_viewed'] as bool?;
    _isInterested = snapshotData['is_interested'] as bool?;
    _phoneNo = snapshotData['phone_no'] as String?;
    _emailId = snapshotData['email_id'] as String?;
    _applicantName = snapshotData['applicant_name'] as String?;
    _affliation = snapshotData['affliation'] as String?;
    _institute = snapshotData['institute'] as String?;
    _resumeAttachment = snapshotData['resume_attachment'] as String?;
    _cvAttachment = snapshotData['cv_attachment'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('applied_jobs')
          : FirebaseFirestore.instance.collectionGroup('applied_jobs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('applied_jobs').doc(id);

  static Stream<AppliedJobsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppliedJobsRecord.fromSnapshot(s));

  static Future<AppliedJobsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppliedJobsRecord.fromSnapshot(s));

  static AppliedJobsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppliedJobsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppliedJobsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppliedJobsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppliedJobsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppliedJobsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppliedJobsRecordData({
  DocumentReference? jobRef,
  DateTime? timestamp,
  bool? isApplicationViewed,
  bool? isInterested,
  String? phoneNo,
  String? emailId,
  String? applicantName,
  String? affliation,
  String? institute,
  String? resumeAttachment,
  String? cvAttachment,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'job_ref': jobRef,
      'timestamp': timestamp,
      'is_application_viewed': isApplicationViewed,
      'is_interested': isInterested,
      'phone_no': phoneNo,
      'email_id': emailId,
      'applicant_name': applicantName,
      'affliation': affliation,
      'institute': institute,
      'resume_attachment': resumeAttachment,
      'cv_attachment': cvAttachment,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppliedJobsRecordDocumentEquality implements Equality<AppliedJobsRecord> {
  const AppliedJobsRecordDocumentEquality();

  @override
  bool equals(AppliedJobsRecord? e1, AppliedJobsRecord? e2) {
    return e1?.jobRef == e2?.jobRef &&
        e1?.timestamp == e2?.timestamp &&
        e1?.isApplicationViewed == e2?.isApplicationViewed &&
        e1?.isInterested == e2?.isInterested &&
        e1?.phoneNo == e2?.phoneNo &&
        e1?.emailId == e2?.emailId &&
        e1?.applicantName == e2?.applicantName &&
        e1?.affliation == e2?.affliation &&
        e1?.institute == e2?.institute &&
        e1?.resumeAttachment == e2?.resumeAttachment &&
        e1?.cvAttachment == e2?.cvAttachment;
  }

  @override
  int hash(AppliedJobsRecord? e) => const ListEquality().hash([
        e?.jobRef,
        e?.timestamp,
        e?.isApplicationViewed,
        e?.isInterested,
        e?.phoneNo,
        e?.emailId,
        e?.applicantName,
        e?.affliation,
        e?.institute,
        e?.resumeAttachment,
        e?.cvAttachment
      ]);

  @override
  bool isValidKey(Object? o) => o is AppliedJobsRecord;
}
