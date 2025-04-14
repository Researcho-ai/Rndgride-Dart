import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LabsRecord extends FirestoreRecord {
  LabsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "lab_name" field.
  String? _labName;
  String get labName => _labName ?? '';
  bool hasLabName() => _labName != null;

  // "lab_address" field.
  String? _labAddress;
  String get labAddress => _labAddress ?? '';
  bool hasLabAddress() => _labAddress != null;

  // "lab_pincode" field.
  String? _labPincode;
  String get labPincode => _labPincode ?? '';
  bool hasLabPincode() => _labPincode != null;

  // "lab_incharge_name" field.
  String? _labInchargeName;
  String get labInchargeName => _labInchargeName ?? '';
  bool hasLabInchargeName() => _labInchargeName != null;

  // "lab_opening_time" field.
  String? _labOpeningTime;
  String get labOpeningTime => _labOpeningTime ?? '';
  bool hasLabOpeningTime() => _labOpeningTime != null;

  // "lab_closing_time" field.
  String? _labClosingTime;
  String get labClosingTime => _labClosingTime ?? '';
  bool hasLabClosingTime() => _labClosingTime != null;

  // "lab_profile_status" field.
  bool? _labProfileStatus;
  bool get labProfileStatus => _labProfileStatus ?? false;
  bool hasLabProfileStatus() => _labProfileStatus != null;

  // "lab_type_ref" field.
  DocumentReference? _labTypeRef;
  DocumentReference? get labTypeRef => _labTypeRef;
  bool hasLabTypeRef() => _labTypeRef != null;

  // "lab_requirement_form" field.
  String? _labRequirementForm;
  String get labRequirementForm => _labRequirementForm ?? '';
  bool hasLabRequirementForm() => _labRequirementForm != null;

  // "lab_certificate_document" field.
  String? _labCertificateDocument;
  String get labCertificateDocument => _labCertificateDocument ?? '';
  bool hasLabCertificateDocument() => _labCertificateDocument != null;

  // "lab_result_duration" field.
  String? _labResultDuration;
  String get labResultDuration => _labResultDuration ?? '';
  bool hasLabResultDuration() => _labResultDuration != null;

  // "lab_working_days" field.
  List<String>? _labWorkingDays;
  List<String> get labWorkingDays => _labWorkingDays ?? const [];
  bool hasLabWorkingDays() => _labWorkingDays != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "is_inperson_allowed" field.
  bool? _isInpersonAllowed;
  bool get isInpersonAllowed => _isInpersonAllowed ?? false;
  bool hasIsInpersonAllowed() => _isInpersonAllowed != null;

  // "is_external_allowed" field.
  bool? _isExternalAllowed;
  bool get isExternalAllowed => _isExternalAllowed ?? false;
  bool hasIsExternalAllowed() => _isExternalAllowed != null;

  // "lab_profile_completion_percentage" field.
  int? _labProfileCompletionPercentage;
  int get labProfileCompletionPercentage =>
      _labProfileCompletionPercentage ?? 0;
  bool hasLabProfileCompletionPercentage() =>
      _labProfileCompletionPercentage != null;

  // "institute_ref" field.
  DocumentReference? _instituteRef;
  DocumentReference? get instituteRef => _instituteRef;
  bool hasInstituteRef() => _instituteRef != null;

  // "certificate_type_ref" field.
  DocumentReference? _certificateTypeRef;
  DocumentReference? get certificateTypeRef => _certificateTypeRef;
  bool hasCertificateTypeRef() => _certificateTypeRef != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "lab_sub_type" field.
  String? _labSubType;
  String get labSubType => _labSubType ?? '';
  bool hasLabSubType() => _labSubType != null;

  // "is_testing_lab" field.
  bool? _isTestingLab;
  bool get isTestingLab => _isTestingLab ?? false;
  bool hasIsTestingLab() => _isTestingLab != null;

  // "lab_state_ref" field.
  DocumentReference? _labStateRef;
  DocumentReference? get labStateRef => _labStateRef;
  bool hasLabStateRef() => _labStateRef != null;

  // "lab_city_ref" field.
  DocumentReference? _labCityRef;
  DocumentReference? get labCityRef => _labCityRef;
  bool hasLabCityRef() => _labCityRef != null;

  // "is_lab_visible" field.
  bool? _isLabVisible;
  bool get isLabVisible => _isLabVisible ?? false;
  bool hasIsLabVisible() => _isLabVisible != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _displayName = snapshotData['display_name'] as String?;
    _labName = snapshotData['lab_name'] as String?;
    _labAddress = snapshotData['lab_address'] as String?;
    _labPincode = snapshotData['lab_pincode'] as String?;
    _labInchargeName = snapshotData['lab_incharge_name'] as String?;
    _labOpeningTime = snapshotData['lab_opening_time'] as String?;
    _labClosingTime = snapshotData['lab_closing_time'] as String?;
    _labProfileStatus = snapshotData['lab_profile_status'] as bool?;
    _labTypeRef = snapshotData['lab_type_ref'] as DocumentReference?;
    _labRequirementForm = snapshotData['lab_requirement_form'] as String?;
    _labCertificateDocument =
        snapshotData['lab_certificate_document'] as String?;
    _labResultDuration = snapshotData['lab_result_duration'] as String?;
    _labWorkingDays = getDataList(snapshotData['lab_working_days']);
    _email = snapshotData['email'] as String?;
    _isInpersonAllowed = snapshotData['is_inperson_allowed'] as bool?;
    _isExternalAllowed = snapshotData['is_external_allowed'] as bool?;
    _labProfileCompletionPercentage =
        castToType<int>(snapshotData['lab_profile_completion_percentage']);
    _instituteRef = snapshotData['institute_ref'] as DocumentReference?;
    _certificateTypeRef =
        snapshotData['certificate_type_ref'] as DocumentReference?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _labSubType = snapshotData['lab_sub_type'] as String?;
    _isTestingLab = snapshotData['is_testing_lab'] as bool?;
    _labStateRef = snapshotData['lab_state_ref'] as DocumentReference?;
    _labCityRef = snapshotData['lab_city_ref'] as DocumentReference?;
    _isLabVisible = snapshotData['is_lab_visible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('labs');

  static Stream<LabsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LabsRecord.fromSnapshot(s));

  static Future<LabsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LabsRecord.fromSnapshot(s));

  static LabsRecord fromSnapshot(DocumentSnapshot snapshot) => LabsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LabsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LabsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LabsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LabsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLabsRecordData({
  String? uid,
  DateTime? createdTime,
  String? displayName,
  String? labName,
  String? labAddress,
  String? labPincode,
  String? labInchargeName,
  String? labOpeningTime,
  String? labClosingTime,
  bool? labProfileStatus,
  DocumentReference? labTypeRef,
  String? labRequirementForm,
  String? labCertificateDocument,
  String? labResultDuration,
  String? email,
  bool? isInpersonAllowed,
  bool? isExternalAllowed,
  int? labProfileCompletionPercentage,
  DocumentReference? instituteRef,
  DocumentReference? certificateTypeRef,
  String? phoneNumber,
  String? photoUrl,
  String? labSubType,
  bool? isTestingLab,
  DocumentReference? labStateRef,
  DocumentReference? labCityRef,
  bool? isLabVisible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'display_name': displayName,
      'lab_name': labName,
      'lab_address': labAddress,
      'lab_pincode': labPincode,
      'lab_incharge_name': labInchargeName,
      'lab_opening_time': labOpeningTime,
      'lab_closing_time': labClosingTime,
      'lab_profile_status': labProfileStatus,
      'lab_type_ref': labTypeRef,
      'lab_requirement_form': labRequirementForm,
      'lab_certificate_document': labCertificateDocument,
      'lab_result_duration': labResultDuration,
      'email': email,
      'is_inperson_allowed': isInpersonAllowed,
      'is_external_allowed': isExternalAllowed,
      'lab_profile_completion_percentage': labProfileCompletionPercentage,
      'institute_ref': instituteRef,
      'certificate_type_ref': certificateTypeRef,
      'phone_number': phoneNumber,
      'photo_url': photoUrl,
      'lab_sub_type': labSubType,
      'is_testing_lab': isTestingLab,
      'lab_state_ref': labStateRef,
      'lab_city_ref': labCityRef,
      'is_lab_visible': isLabVisible,
    }.withoutNulls,
  );

  return firestoreData;
}

class LabsRecordDocumentEquality implements Equality<LabsRecord> {
  const LabsRecordDocumentEquality();

  @override
  bool equals(LabsRecord? e1, LabsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.displayName == e2?.displayName &&
        e1?.labName == e2?.labName &&
        e1?.labAddress == e2?.labAddress &&
        e1?.labPincode == e2?.labPincode &&
        e1?.labInchargeName == e2?.labInchargeName &&
        e1?.labOpeningTime == e2?.labOpeningTime &&
        e1?.labClosingTime == e2?.labClosingTime &&
        e1?.labProfileStatus == e2?.labProfileStatus &&
        e1?.labTypeRef == e2?.labTypeRef &&
        e1?.labRequirementForm == e2?.labRequirementForm &&
        e1?.labCertificateDocument == e2?.labCertificateDocument &&
        e1?.labResultDuration == e2?.labResultDuration &&
        listEquality.equals(e1?.labWorkingDays, e2?.labWorkingDays) &&
        e1?.email == e2?.email &&
        e1?.isInpersonAllowed == e2?.isInpersonAllowed &&
        e1?.isExternalAllowed == e2?.isExternalAllowed &&
        e1?.labProfileCompletionPercentage ==
            e2?.labProfileCompletionPercentage &&
        e1?.instituteRef == e2?.instituteRef &&
        e1?.certificateTypeRef == e2?.certificateTypeRef &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.labSubType == e2?.labSubType &&
        e1?.isTestingLab == e2?.isTestingLab &&
        e1?.labStateRef == e2?.labStateRef &&
        e1?.labCityRef == e2?.labCityRef &&
        e1?.isLabVisible == e2?.isLabVisible;
  }

  @override
  int hash(LabsRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.displayName,
        e?.labName,
        e?.labAddress,
        e?.labPincode,
        e?.labInchargeName,
        e?.labOpeningTime,
        e?.labClosingTime,
        e?.labProfileStatus,
        e?.labTypeRef,
        e?.labRequirementForm,
        e?.labCertificateDocument,
        e?.labResultDuration,
        e?.labWorkingDays,
        e?.email,
        e?.isInpersonAllowed,
        e?.isExternalAllowed,
        e?.labProfileCompletionPercentage,
        e?.instituteRef,
        e?.certificateTypeRef,
        e?.phoneNumber,
        e?.photoUrl,
        e?.labSubType,
        e?.isTestingLab,
        e?.labStateRef,
        e?.labCityRef,
        e?.isLabVisible
      ]);

  @override
  bool isValidKey(Object? o) => o is LabsRecord;
}
