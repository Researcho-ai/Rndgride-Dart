// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SearchHistoryStruct extends FFFirebaseStruct {
  SearchHistoryStruct({
    String? searchTerm,
    DateTime? time,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _searchTerm = searchTerm,
        _time = time,
        super(firestoreUtilData);

  // "search_term" field.
  String? _searchTerm;
  String get searchTerm => _searchTerm ?? '';
  set searchTerm(String? val) => _searchTerm = val;

  bool hasSearchTerm() => _searchTerm != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;

  bool hasTime() => _time != null;

  static SearchHistoryStruct fromMap(Map<String, dynamic> data) =>
      SearchHistoryStruct(
        searchTerm: data['search_term'] as String?,
        time: data['time'] as DateTime?,
      );

  static SearchHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? SearchHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'search_term': _searchTerm,
        'time': _time,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'search_term': serializeParam(
          _searchTerm,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static SearchHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      SearchHistoryStruct(
        searchTerm: deserializeParam(
          data['search_term'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'SearchHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SearchHistoryStruct &&
        searchTerm == other.searchTerm &&
        time == other.time;
  }

  @override
  int get hashCode => const ListEquality().hash([searchTerm, time]);
}

SearchHistoryStruct createSearchHistoryStruct({
  String? searchTerm,
  DateTime? time,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SearchHistoryStruct(
      searchTerm: searchTerm,
      time: time,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SearchHistoryStruct? updateSearchHistoryStruct(
  SearchHistoryStruct? searchHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    searchHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSearchHistoryStructData(
  Map<String, dynamic> firestoreData,
  SearchHistoryStruct? searchHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (searchHistory == null) {
    return;
  }
  if (searchHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && searchHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final searchHistoryData =
      getSearchHistoryFirestoreData(searchHistory, forFieldValue);
  final nestedData =
      searchHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = searchHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSearchHistoryFirestoreData(
  SearchHistoryStruct? searchHistory, [
  bool forFieldValue = false,
]) {
  if (searchHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(searchHistory.toMap());

  // Add any Firestore field values
  searchHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSearchHistoryListFirestoreData(
  List<SearchHistoryStruct>? searchHistorys,
) =>
    searchHistorys
        ?.map((e) => getSearchHistoryFirestoreData(e, true))
        .toList() ??
    [];
