import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InstitutesRecord extends FirestoreRecord {
  InstitutesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "institute_name" field.
  String? _instituteName;
  String get instituteName => _instituteName ?? '';
  bool hasInstituteName() => _instituteName != null;

  // "institute_type_ref" field.
  DocumentReference? _instituteTypeRef;
  DocumentReference? get instituteTypeRef => _instituteTypeRef;
  bool hasInstituteTypeRef() => _instituteTypeRef != null;

  // "institute_image" field.
  String? _instituteImage;
  String get instituteImage => _instituteImage ?? '';
  bool hasInstituteImage() => _instituteImage != null;

  // "institute_state" field.
  String? _instituteState;
  String get instituteState => _instituteState ?? '';
  bool hasInstituteState() => _instituteState != null;

  // "institute_city" field.
  String? _instituteCity;
  String get instituteCity => _instituteCity ?? '';
  bool hasInstituteCity() => _instituteCity != null;

  // "institute_address" field.
  String? _instituteAddress;
  String get instituteAddress => _instituteAddress ?? '';
  bool hasInstituteAddress() => _instituteAddress != null;

  // "institute_pincode" field.
  String? _institutePincode;
  String get institutePincode => _institutePincode ?? '';
  bool hasInstitutePincode() => _institutePincode != null;

  // "institute_working_days" field.
  List<String>? _instituteWorkingDays;
  List<String> get instituteWorkingDays => _instituteWorkingDays ?? const [];
  bool hasInstituteWorkingDays() => _instituteWorkingDays != null;

  // "institute_oppening_time" field.
  String? _instituteOppeningTime;
  String get instituteOppeningTime => _instituteOppeningTime ?? '';
  bool hasInstituteOppeningTime() => _instituteOppeningTime != null;

  // "institute_closing_time" field.
  String? _instituteClosingTime;
  String get instituteClosingTime => _instituteClosingTime ?? '';
  bool hasInstituteClosingTime() => _instituteClosingTime != null;

  // "institute_email" field.
  String? _instituteEmail;
  String get instituteEmail => _instituteEmail ?? '';
  bool hasInstituteEmail() => _instituteEmail != null;

  // "institute_city_ref" field.
  DocumentReference? _instituteCityRef;
  DocumentReference? get instituteCityRef => _instituteCityRef;
  bool hasInstituteCityRef() => _instituteCityRef != null;

  // "institute_state_ref" field.
  DocumentReference? _instituteStateRef;
  DocumentReference? get instituteStateRef => _instituteStateRef;
  bool hasInstituteStateRef() => _instituteStateRef != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "admin_name" field.
  String? _adminName;
  String get adminName => _adminName ?? '';
  bool hasAdminName() => _adminName != null;

  // "admin_phone_number" field.
  String? _adminPhoneNumber;
  String get adminPhoneNumber => _adminPhoneNumber ?? '';
  bool hasAdminPhoneNumber() => _adminPhoneNumber != null;

  // "institute_status" field.
  bool? _instituteStatus;
  bool get instituteStatus => _instituteStatus ?? false;
  bool hasInstituteStatus() => _instituteStatus != null;

  // "institute_profile_completion_percentage" field.
  int? _instituteProfileCompletionPercentage;
  int get instituteProfileCompletionPercentage =>
      _instituteProfileCompletionPercentage ?? 0;
  bool hasInstituteProfileCompletionPercentage() =>
      _instituteProfileCompletionPercentage != null;

  // "institute_labs_list" field.
  List<InstituteLabsStruct>? _instituteLabsList;
  List<InstituteLabsStruct> get instituteLabsList =>
      _instituteLabsList ?? const [];
  bool hasInstituteLabsList() => _instituteLabsList != null;

  // "is_testing_institute" field.
  bool? _isTestingInstitute;
  bool get isTestingInstitute => _isTestingInstitute ?? false;
  bool hasIsTestingInstitute() => _isTestingInstitute != null;

  // "is_institute_visible" field.
  bool? _isInstituteVisible;
  bool get isInstituteVisible => _isInstituteVisible ?? false;
  bool hasIsInstituteVisible() => _isInstituteVisible != null;

  void _initializeFields() {
    _instituteName = snapshotData['institute_name'] as String?;
    _instituteTypeRef =
        snapshotData['institute_type_ref'] as DocumentReference?;
    _instituteImage = snapshotData['institute_image'] as String?;
    _instituteState = snapshotData['institute_state'] as String?;
    _instituteCity = snapshotData['institute_city'] as String?;
    _instituteAddress = snapshotData['institute_address'] as String?;
    _institutePincode = snapshotData['institute_pincode'] as String?;
    _instituteWorkingDays = getDataList(snapshotData['institute_working_days']);
    _instituteOppeningTime = snapshotData['institute_oppening_time'] as String?;
    _instituteClosingTime = snapshotData['institute_closing_time'] as String?;
    _instituteEmail = snapshotData['institute_email'] as String?;
    _instituteCityRef =
        snapshotData['institute_city_ref'] as DocumentReference?;
    _instituteStateRef =
        snapshotData['institute_state_ref'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _adminName = snapshotData['admin_name'] as String?;
    _adminPhoneNumber = snapshotData['admin_phone_number'] as String?;
    _instituteStatus = snapshotData['institute_status'] as bool?;
    _instituteProfileCompletionPercentage = castToType<int>(
        snapshotData['institute_profile_completion_percentage']);
    _instituteLabsList = getStructList(
      snapshotData['institute_labs_list'],
      InstituteLabsStruct.fromMap,
    );
    _isTestingInstitute = snapshotData['is_testing_institute'] as bool?;
    _isInstituteVisible = snapshotData['is_institute_visible'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('institutes');

  static Stream<InstitutesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InstitutesRecord.fromSnapshot(s));

  static Future<InstitutesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InstitutesRecord.fromSnapshot(s));

  static InstitutesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InstitutesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InstitutesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InstitutesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InstitutesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InstitutesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInstitutesRecordData({
  String? instituteName,
  DocumentReference? instituteTypeRef,
  String? instituteImage,
  String? instituteState,
  String? instituteCity,
  String? instituteAddress,
  String? institutePincode,
  String? instituteOppeningTime,
  String? instituteClosingTime,
  String? instituteEmail,
  DocumentReference? instituteCityRef,
  DocumentReference? instituteStateRef,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? adminName,
  String? adminPhoneNumber,
  bool? instituteStatus,
  int? instituteProfileCompletionPercentage,
  bool? isTestingInstitute,
  bool? isInstituteVisible,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'institute_name': instituteName,
      'institute_type_ref': instituteTypeRef,
      'institute_image': instituteImage,
      'institute_state': instituteState,
      'institute_city': instituteCity,
      'institute_address': instituteAddress,
      'institute_pincode': institutePincode,
      'institute_oppening_time': instituteOppeningTime,
      'institute_closing_time': instituteClosingTime,
      'institute_email': instituteEmail,
      'institute_city_ref': instituteCityRef,
      'institute_state_ref': instituteStateRef,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'admin_name': adminName,
      'admin_phone_number': adminPhoneNumber,
      'institute_status': instituteStatus,
      'institute_profile_completion_percentage':
          instituteProfileCompletionPercentage,
      'is_testing_institute': isTestingInstitute,
      'is_institute_visible': isInstituteVisible,
    }.withoutNulls,
  );

  return firestoreData;
}

class InstitutesRecordDocumentEquality implements Equality<InstitutesRecord> {
  const InstitutesRecordDocumentEquality();

  @override
  bool equals(InstitutesRecord? e1, InstitutesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.instituteName == e2?.instituteName &&
        e1?.instituteTypeRef == e2?.instituteTypeRef &&
        e1?.instituteImage == e2?.instituteImage &&
        e1?.instituteState == e2?.instituteState &&
        e1?.instituteCity == e2?.instituteCity &&
        e1?.instituteAddress == e2?.instituteAddress &&
        e1?.institutePincode == e2?.institutePincode &&
        listEquality.equals(
            e1?.instituteWorkingDays, e2?.instituteWorkingDays) &&
        e1?.instituteOppeningTime == e2?.instituteOppeningTime &&
        e1?.instituteClosingTime == e2?.instituteClosingTime &&
        e1?.instituteEmail == e2?.instituteEmail &&
        e1?.instituteCityRef == e2?.instituteCityRef &&
        e1?.instituteStateRef == e2?.instituteStateRef &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.adminName == e2?.adminName &&
        e1?.adminPhoneNumber == e2?.adminPhoneNumber &&
        e1?.instituteStatus == e2?.instituteStatus &&
        e1?.instituteProfileCompletionPercentage ==
            e2?.instituteProfileCompletionPercentage &&
        listEquality.equals(e1?.instituteLabsList, e2?.instituteLabsList) &&
        e1?.isTestingInstitute == e2?.isTestingInstitute &&
        e1?.isInstituteVisible == e2?.isInstituteVisible;
  }

  @override
  int hash(InstitutesRecord? e) => const ListEquality().hash([
        e?.instituteName,
        e?.instituteTypeRef,
        e?.instituteImage,
        e?.instituteState,
        e?.instituteCity,
        e?.instituteAddress,
        e?.institutePincode,
        e?.instituteWorkingDays,
        e?.instituteOppeningTime,
        e?.instituteClosingTime,
        e?.instituteEmail,
        e?.instituteCityRef,
        e?.instituteStateRef,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.adminName,
        e?.adminPhoneNumber,
        e?.instituteStatus,
        e?.instituteProfileCompletionPercentage,
        e?.instituteLabsList,
        e?.isTestingInstitute,
        e?.isInstituteVisible
      ]);

  @override
  bool isValidKey(Object? o) => o is InstitutesRecord;
}
