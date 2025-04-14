// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class JobsStruct extends FFFirebaseStruct {
  JobsStruct({
    String? id,
    String? jobTitle,
    String? location,
    String? companyName,
    String? salary,
    String? benefits,
    String? requiredSkills,
    String? duration,
    String? field,
    String? description,
    String? applicationDeadline,
    String? howToApply,
    String? jobUrl,
    String? jobType,
    String? applicationApplicationStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _jobTitle = jobTitle,
        _location = location,
        _companyName = companyName,
        _salary = salary,
        _benefits = benefits,
        _requiredSkills = requiredSkills,
        _duration = duration,
        _field = field,
        _description = description,
        _applicationDeadline = applicationDeadline,
        _howToApply = howToApply,
        _jobUrl = jobUrl,
        _jobType = jobType,
        _applicationApplicationStatus = applicationApplicationStatus,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "job_title" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  set jobTitle(String? val) => _jobTitle = val;

  bool hasJobTitle() => _jobTitle != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  set companyName(String? val) => _companyName = val;

  bool hasCompanyName() => _companyName != null;

  // "salary" field.
  String? _salary;
  String get salary => _salary ?? '';
  set salary(String? val) => _salary = val;

  bool hasSalary() => _salary != null;

  // "benefits" field.
  String? _benefits;
  String get benefits => _benefits ?? '';
  set benefits(String? val) => _benefits = val;

  bool hasBenefits() => _benefits != null;

  // "required_skills" field.
  String? _requiredSkills;
  String get requiredSkills => _requiredSkills ?? '';
  set requiredSkills(String? val) => _requiredSkills = val;

  bool hasRequiredSkills() => _requiredSkills != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  set duration(String? val) => _duration = val;

  bool hasDuration() => _duration != null;

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  set field(String? val) => _field = val;

  bool hasField() => _field != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "application_deadline" field.
  String? _applicationDeadline;
  String get applicationDeadline => _applicationDeadline ?? '';
  set applicationDeadline(String? val) => _applicationDeadline = val;

  bool hasApplicationDeadline() => _applicationDeadline != null;

  // "how_to_apply" field.
  String? _howToApply;
  String get howToApply => _howToApply ?? '';
  set howToApply(String? val) => _howToApply = val;

  bool hasHowToApply() => _howToApply != null;

  // "job_url" field.
  String? _jobUrl;
  String get jobUrl => _jobUrl ?? '';
  set jobUrl(String? val) => _jobUrl = val;

  bool hasJobUrl() => _jobUrl != null;

  // "job_type" field.
  String? _jobType;
  String get jobType => _jobType ?? '';
  set jobType(String? val) => _jobType = val;

  bool hasJobType() => _jobType != null;

  // "application_application_status" field.
  String? _applicationApplicationStatus;
  String get applicationApplicationStatus =>
      _applicationApplicationStatus ?? '';
  set applicationApplicationStatus(String? val) =>
      _applicationApplicationStatus = val;

  bool hasApplicationApplicationStatus() =>
      _applicationApplicationStatus != null;

  static JobsStruct fromMap(Map<String, dynamic> data) => JobsStruct(
        id: data['id'] as String?,
        jobTitle: data['job_title'] as String?,
        location: data['location'] as String?,
        companyName: data['company_name'] as String?,
        salary: data['salary'] as String?,
        benefits: data['benefits'] as String?,
        requiredSkills: data['required_skills'] as String?,
        duration: data['duration'] as String?,
        field: data['field'] as String?,
        description: data['description'] as String?,
        applicationDeadline: data['application_deadline'] as String?,
        howToApply: data['how_to_apply'] as String?,
        jobUrl: data['job_url'] as String?,
        jobType: data['job_type'] as String?,
        applicationApplicationStatus:
            data['application_application_status'] as String?,
      );

  static JobsStruct? maybeFromMap(dynamic data) =>
      data is Map ? JobsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'job_title': _jobTitle,
        'location': _location,
        'company_name': _companyName,
        'salary': _salary,
        'benefits': _benefits,
        'required_skills': _requiredSkills,
        'duration': _duration,
        'field': _field,
        'description': _description,
        'application_deadline': _applicationDeadline,
        'how_to_apply': _howToApply,
        'job_url': _jobUrl,
        'job_type': _jobType,
        'application_application_status': _applicationApplicationStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'job_title': serializeParam(
          _jobTitle,
          ParamType.String,
        ),
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'company_name': serializeParam(
          _companyName,
          ParamType.String,
        ),
        'salary': serializeParam(
          _salary,
          ParamType.String,
        ),
        'benefits': serializeParam(
          _benefits,
          ParamType.String,
        ),
        'required_skills': serializeParam(
          _requiredSkills,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.String,
        ),
        'field': serializeParam(
          _field,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'application_deadline': serializeParam(
          _applicationDeadline,
          ParamType.String,
        ),
        'how_to_apply': serializeParam(
          _howToApply,
          ParamType.String,
        ),
        'job_url': serializeParam(
          _jobUrl,
          ParamType.String,
        ),
        'job_type': serializeParam(
          _jobType,
          ParamType.String,
        ),
        'application_application_status': serializeParam(
          _applicationApplicationStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static JobsStruct fromSerializableMap(Map<String, dynamic> data) =>
      JobsStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        jobTitle: deserializeParam(
          data['job_title'],
          ParamType.String,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        companyName: deserializeParam(
          data['company_name'],
          ParamType.String,
          false,
        ),
        salary: deserializeParam(
          data['salary'],
          ParamType.String,
          false,
        ),
        benefits: deserializeParam(
          data['benefits'],
          ParamType.String,
          false,
        ),
        requiredSkills: deserializeParam(
          data['required_skills'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.String,
          false,
        ),
        field: deserializeParam(
          data['field'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        applicationDeadline: deserializeParam(
          data['application_deadline'],
          ParamType.String,
          false,
        ),
        howToApply: deserializeParam(
          data['how_to_apply'],
          ParamType.String,
          false,
        ),
        jobUrl: deserializeParam(
          data['job_url'],
          ParamType.String,
          false,
        ),
        jobType: deserializeParam(
          data['job_type'],
          ParamType.String,
          false,
        ),
        applicationApplicationStatus: deserializeParam(
          data['application_application_status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'JobsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JobsStruct &&
        id == other.id &&
        jobTitle == other.jobTitle &&
        location == other.location &&
        companyName == other.companyName &&
        salary == other.salary &&
        benefits == other.benefits &&
        requiredSkills == other.requiredSkills &&
        duration == other.duration &&
        field == other.field &&
        description == other.description &&
        applicationDeadline == other.applicationDeadline &&
        howToApply == other.howToApply &&
        jobUrl == other.jobUrl &&
        jobType == other.jobType &&
        applicationApplicationStatus == other.applicationApplicationStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        jobTitle,
        location,
        companyName,
        salary,
        benefits,
        requiredSkills,
        duration,
        field,
        description,
        applicationDeadline,
        howToApply,
        jobUrl,
        jobType,
        applicationApplicationStatus
      ]);
}

JobsStruct createJobsStruct({
  String? id,
  String? jobTitle,
  String? location,
  String? companyName,
  String? salary,
  String? benefits,
  String? requiredSkills,
  String? duration,
  String? field,
  String? description,
  String? applicationDeadline,
  String? howToApply,
  String? jobUrl,
  String? jobType,
  String? applicationApplicationStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    JobsStruct(
      id: id,
      jobTitle: jobTitle,
      location: location,
      companyName: companyName,
      salary: salary,
      benefits: benefits,
      requiredSkills: requiredSkills,
      duration: duration,
      field: field,
      description: description,
      applicationDeadline: applicationDeadline,
      howToApply: howToApply,
      jobUrl: jobUrl,
      jobType: jobType,
      applicationApplicationStatus: applicationApplicationStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

JobsStruct? updateJobsStruct(
  JobsStruct? jobs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    jobs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addJobsStructData(
  Map<String, dynamic> firestoreData,
  JobsStruct? jobs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (jobs == null) {
    return;
  }
  if (jobs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && jobs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final jobsData = getJobsFirestoreData(jobs, forFieldValue);
  final nestedData = jobsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = jobs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getJobsFirestoreData(
  JobsStruct? jobs, [
  bool forFieldValue = false,
]) {
  if (jobs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(jobs.toMap());

  // Add any Firestore field values
  jobs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getJobsListFirestoreData(
  List<JobsStruct>? jobss,
) =>
    jobss?.map((e) => getJobsFirestoreData(e, true)).toList() ?? [];
