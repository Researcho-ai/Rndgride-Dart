// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TopNavBarOnSelectStruct extends FFFirebaseStruct {
  TopNavBarOnSelectStruct({
    bool? home,
    bool? bookings,
    bool? history,
    bool? aboutUs,
    bool? contactUs,
    bool? forum,
    bool? instruments,
    bool? community,
    bool? lab,
    bool? jobs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _home = home,
        _bookings = bookings,
        _history = history,
        _aboutUs = aboutUs,
        _contactUs = contactUs,
        _forum = forum,
        _instruments = instruments,
        _community = community,
        _lab = lab,
        _jobs = jobs,
        super(firestoreUtilData);

  // "home" field.
  bool? _home;
  bool get home => _home ?? false;
  set home(bool? val) => _home = val;

  bool hasHome() => _home != null;

  // "bookings" field.
  bool? _bookings;
  bool get bookings => _bookings ?? false;
  set bookings(bool? val) => _bookings = val;

  bool hasBookings() => _bookings != null;

  // "history" field.
  bool? _history;
  bool get history => _history ?? false;
  set history(bool? val) => _history = val;

  bool hasHistory() => _history != null;

  // "about_us" field.
  bool? _aboutUs;
  bool get aboutUs => _aboutUs ?? false;
  set aboutUs(bool? val) => _aboutUs = val;

  bool hasAboutUs() => _aboutUs != null;

  // "contact_us" field.
  bool? _contactUs;
  bool get contactUs => _contactUs ?? false;
  set contactUs(bool? val) => _contactUs = val;

  bool hasContactUs() => _contactUs != null;

  // "forum" field.
  bool? _forum;
  bool get forum => _forum ?? false;
  set forum(bool? val) => _forum = val;

  bool hasForum() => _forum != null;

  // "instruments" field.
  bool? _instruments;
  bool get instruments => _instruments ?? false;
  set instruments(bool? val) => _instruments = val;

  bool hasInstruments() => _instruments != null;

  // "community" field.
  bool? _community;
  bool get community => _community ?? false;
  set community(bool? val) => _community = val;

  bool hasCommunity() => _community != null;

  // "lab" field.
  bool? _lab;
  bool get lab => _lab ?? false;
  set lab(bool? val) => _lab = val;

  bool hasLab() => _lab != null;

  // "jobs" field.
  bool? _jobs;
  bool get jobs => _jobs ?? false;
  set jobs(bool? val) => _jobs = val;

  bool hasJobs() => _jobs != null;

  static TopNavBarOnSelectStruct fromMap(Map<String, dynamic> data) =>
      TopNavBarOnSelectStruct(
        home: data['home'] as bool?,
        bookings: data['bookings'] as bool?,
        history: data['history'] as bool?,
        aboutUs: data['about_us'] as bool?,
        contactUs: data['contact_us'] as bool?,
        forum: data['forum'] as bool?,
        instruments: data['instruments'] as bool?,
        community: data['community'] as bool?,
        lab: data['lab'] as bool?,
        jobs: data['jobs'] as bool?,
      );

  static TopNavBarOnSelectStruct? maybeFromMap(dynamic data) => data is Map
      ? TopNavBarOnSelectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'home': _home,
        'bookings': _bookings,
        'history': _history,
        'about_us': _aboutUs,
        'contact_us': _contactUs,
        'forum': _forum,
        'instruments': _instruments,
        'community': _community,
        'lab': _lab,
        'jobs': _jobs,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'home': serializeParam(
          _home,
          ParamType.bool,
        ),
        'bookings': serializeParam(
          _bookings,
          ParamType.bool,
        ),
        'history': serializeParam(
          _history,
          ParamType.bool,
        ),
        'about_us': serializeParam(
          _aboutUs,
          ParamType.bool,
        ),
        'contact_us': serializeParam(
          _contactUs,
          ParamType.bool,
        ),
        'forum': serializeParam(
          _forum,
          ParamType.bool,
        ),
        'instruments': serializeParam(
          _instruments,
          ParamType.bool,
        ),
        'community': serializeParam(
          _community,
          ParamType.bool,
        ),
        'lab': serializeParam(
          _lab,
          ParamType.bool,
        ),
        'jobs': serializeParam(
          _jobs,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TopNavBarOnSelectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TopNavBarOnSelectStruct(
        home: deserializeParam(
          data['home'],
          ParamType.bool,
          false,
        ),
        bookings: deserializeParam(
          data['bookings'],
          ParamType.bool,
          false,
        ),
        history: deserializeParam(
          data['history'],
          ParamType.bool,
          false,
        ),
        aboutUs: deserializeParam(
          data['about_us'],
          ParamType.bool,
          false,
        ),
        contactUs: deserializeParam(
          data['contact_us'],
          ParamType.bool,
          false,
        ),
        forum: deserializeParam(
          data['forum'],
          ParamType.bool,
          false,
        ),
        instruments: deserializeParam(
          data['instruments'],
          ParamType.bool,
          false,
        ),
        community: deserializeParam(
          data['community'],
          ParamType.bool,
          false,
        ),
        lab: deserializeParam(
          data['lab'],
          ParamType.bool,
          false,
        ),
        jobs: deserializeParam(
          data['jobs'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TopNavBarOnSelectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TopNavBarOnSelectStruct &&
        home == other.home &&
        bookings == other.bookings &&
        history == other.history &&
        aboutUs == other.aboutUs &&
        contactUs == other.contactUs &&
        forum == other.forum &&
        instruments == other.instruments &&
        community == other.community &&
        lab == other.lab &&
        jobs == other.jobs;
  }

  @override
  int get hashCode => const ListEquality().hash([
        home,
        bookings,
        history,
        aboutUs,
        contactUs,
        forum,
        instruments,
        community,
        lab,
        jobs
      ]);
}

TopNavBarOnSelectStruct createTopNavBarOnSelectStruct({
  bool? home,
  bool? bookings,
  bool? history,
  bool? aboutUs,
  bool? contactUs,
  bool? forum,
  bool? instruments,
  bool? community,
  bool? lab,
  bool? jobs,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TopNavBarOnSelectStruct(
      home: home,
      bookings: bookings,
      history: history,
      aboutUs: aboutUs,
      contactUs: contactUs,
      forum: forum,
      instruments: instruments,
      community: community,
      lab: lab,
      jobs: jobs,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TopNavBarOnSelectStruct? updateTopNavBarOnSelectStruct(
  TopNavBarOnSelectStruct? topNavBarOnSelect, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    topNavBarOnSelect
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTopNavBarOnSelectStructData(
  Map<String, dynamic> firestoreData,
  TopNavBarOnSelectStruct? topNavBarOnSelect,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (topNavBarOnSelect == null) {
    return;
  }
  if (topNavBarOnSelect.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && topNavBarOnSelect.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final topNavBarOnSelectData =
      getTopNavBarOnSelectFirestoreData(topNavBarOnSelect, forFieldValue);
  final nestedData =
      topNavBarOnSelectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = topNavBarOnSelect.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTopNavBarOnSelectFirestoreData(
  TopNavBarOnSelectStruct? topNavBarOnSelect, [
  bool forFieldValue = false,
]) {
  if (topNavBarOnSelect == null) {
    return {};
  }
  final firestoreData = mapToFirestore(topNavBarOnSelect.toMap());

  // Add any Firestore field values
  topNavBarOnSelect.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTopNavBarOnSelectListFirestoreData(
  List<TopNavBarOnSelectStruct>? topNavBarOnSelects,
) =>
    topNavBarOnSelects
        ?.map((e) => getTopNavBarOnSelectFirestoreData(e, true))
        .toList() ??
    [];
