import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _searchHistory = (await secureStorage.getStringList('ff_searchHistory'))
              ?.map((x) {
                try {
                  return SearchHistoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _searchHistory;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_userProfileData') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_userProfileData') ?? '{}';
          _userProfileData = UserProfileDataStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _defaultInstituteList = [];
  List<DocumentReference> get defaultInstituteList => _defaultInstituteList;
  set defaultInstituteList(List<DocumentReference> value) {
    _defaultInstituteList = value;
  }

  void addToDefaultInstituteList(DocumentReference value) {
    defaultInstituteList.add(value);
  }

  void removeFromDefaultInstituteList(DocumentReference value) {
    defaultInstituteList.remove(value);
  }

  void removeAtIndexFromDefaultInstituteList(int index) {
    defaultInstituteList.removeAt(index);
  }

  void updateDefaultInstituteListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    defaultInstituteList[index] = updateFn(_defaultInstituteList[index]);
  }

  void insertAtIndexInDefaultInstituteList(int index, DocumentReference value) {
    defaultInstituteList.insert(index, value);
  }

  TopNavBarOnSelectStruct _topnavBaronSelect =
      TopNavBarOnSelectStruct.fromSerializableMap(
          jsonDecode('{\"home\":\"true\"}'));
  TopNavBarOnSelectStruct get topnavBaronSelect => _topnavBaronSelect;
  set topnavBaronSelect(TopNavBarOnSelectStruct value) {
    _topnavBaronSelect = value;
  }

  void updateTopnavBaronSelectStruct(
      Function(TopNavBarOnSelectStruct) updateFn) {
    updateFn(_topnavBaronSelect);
  }

  List<DocumentReference> _defaultLabList = [];
  List<DocumentReference> get defaultLabList => _defaultLabList;
  set defaultLabList(List<DocumentReference> value) {
    _defaultLabList = value;
  }

  void addToDefaultLabList(DocumentReference value) {
    defaultLabList.add(value);
  }

  void removeFromDefaultLabList(DocumentReference value) {
    defaultLabList.remove(value);
  }

  void removeAtIndexFromDefaultLabList(int index) {
    defaultLabList.removeAt(index);
  }

  void updateDefaultLabListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    defaultLabList[index] = updateFn(_defaultLabList[index]);
  }

  void insertAtIndexInDefaultLabList(int index, DocumentReference value) {
    defaultLabList.insert(index, value);
  }

  List<String> _analysisNameList = [];
  List<String> get analysisNameList => _analysisNameList;
  set analysisNameList(List<String> value) {
    _analysisNameList = value;
  }

  void addToAnalysisNameList(String value) {
    analysisNameList.add(value);
  }

  void removeFromAnalysisNameList(String value) {
    analysisNameList.remove(value);
  }

  void removeAtIndexFromAnalysisNameList(int index) {
    analysisNameList.removeAt(index);
  }

  void updateAnalysisNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    analysisNameList[index] = updateFn(_analysisNameList[index]);
  }

  void insertAtIndexInAnalysisNameList(int index, String value) {
    analysisNameList.insert(index, value);
  }

  List<String> _subMaterialList = [];
  List<String> get subMaterialList => _subMaterialList;
  set subMaterialList(List<String> value) {
    _subMaterialList = value;
  }

  void addToSubMaterialList(String value) {
    subMaterialList.add(value);
  }

  void removeFromSubMaterialList(String value) {
    subMaterialList.remove(value);
  }

  void removeAtIndexFromSubMaterialList(int index) {
    subMaterialList.removeAt(index);
  }

  void updateSubMaterialListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    subMaterialList[index] = updateFn(_subMaterialList[index]);
  }

  void insertAtIndexInSubMaterialList(int index, String value) {
    subMaterialList.insert(index, value);
  }

  List<String> _searchOutput = [];
  List<String> get searchOutput => _searchOutput;
  set searchOutput(List<String> value) {
    _searchOutput = value;
  }

  void addToSearchOutput(String value) {
    searchOutput.add(value);
  }

  void removeFromSearchOutput(String value) {
    searchOutput.remove(value);
  }

  void removeAtIndexFromSearchOutput(int index) {
    searchOutput.removeAt(index);
  }

  void updateSearchOutputAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchOutput[index] = updateFn(_searchOutput[index]);
  }

  void insertAtIndexInSearchOutput(int index, String value) {
    searchOutput.insert(index, value);
  }

  List<String> _instrumentMaterialNameList = [];
  List<String> get instrumentMaterialNameList => _instrumentMaterialNameList;
  set instrumentMaterialNameList(List<String> value) {
    _instrumentMaterialNameList = value;
  }

  void addToInstrumentMaterialNameList(String value) {
    instrumentMaterialNameList.add(value);
  }

  void removeFromInstrumentMaterialNameList(String value) {
    instrumentMaterialNameList.remove(value);
  }

  void removeAtIndexFromInstrumentMaterialNameList(int index) {
    instrumentMaterialNameList.removeAt(index);
  }

  void updateInstrumentMaterialNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    instrumentMaterialNameList[index] =
        updateFn(_instrumentMaterialNameList[index]);
  }

  void insertAtIndexInInstrumentMaterialNameList(int index, String value) {
    instrumentMaterialNameList.insert(index, value);
  }

  List<SearchHistoryStruct> _searchHistory = [];
  List<SearchHistoryStruct> get searchHistory => _searchHistory;
  set searchHistory(List<SearchHistoryStruct> value) {
    _searchHistory = value;
    secureStorage.setStringList(
        'ff_searchHistory', value.map((x) => x.serialize()).toList());
  }

  void deleteSearchHistory() {
    secureStorage.delete(key: 'ff_searchHistory');
  }

  void addToSearchHistory(SearchHistoryStruct value) {
    searchHistory.add(value);
    secureStorage.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void removeFromSearchHistory(SearchHistoryStruct value) {
    searchHistory.remove(value);
    secureStorage.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSearchHistory(int index) {
    searchHistory.removeAt(index);
    secureStorage.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void updateSearchHistoryAtIndex(
    int index,
    SearchHistoryStruct Function(SearchHistoryStruct) updateFn,
  ) {
    searchHistory[index] = updateFn(_searchHistory[index]);
    secureStorage.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInSearchHistory(int index, SearchHistoryStruct value) {
    searchHistory.insert(index, value);
    secureStorage.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  List<String> _testNameList = [];
  List<String> get testNameList => _testNameList;
  set testNameList(List<String> value) {
    _testNameList = value;
  }

  void addToTestNameList(String value) {
    testNameList.add(value);
  }

  void removeFromTestNameList(String value) {
    testNameList.remove(value);
  }

  void removeAtIndexFromTestNameList(int index) {
    testNameList.removeAt(index);
  }

  void updateTestNameListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    testNameList[index] = updateFn(_testNameList[index]);
  }

  void insertAtIndexInTestNameList(int index, String value) {
    testNameList.insert(index, value);
  }

  List<DocumentRefListStruct> _instrumentTestRefList = [];
  List<DocumentRefListStruct> get instrumentTestRefList =>
      _instrumentTestRefList;
  set instrumentTestRefList(List<DocumentRefListStruct> value) {
    _instrumentTestRefList = value;
  }

  void addToInstrumentTestRefList(DocumentRefListStruct value) {
    instrumentTestRefList.add(value);
  }

  void removeFromInstrumentTestRefList(DocumentRefListStruct value) {
    instrumentTestRefList.remove(value);
  }

  void removeAtIndexFromInstrumentTestRefList(int index) {
    instrumentTestRefList.removeAt(index);
  }

  void updateInstrumentTestRefListAtIndex(
    int index,
    DocumentRefListStruct Function(DocumentRefListStruct) updateFn,
  ) {
    instrumentTestRefList[index] = updateFn(_instrumentTestRefList[index]);
  }

  void insertAtIndexInInstrumentTestRefList(
      int index, DocumentRefListStruct value) {
    instrumentTestRefList.insert(index, value);
  }

  List<DocumentRefListStruct> _initialInstrumentTestRefList = [];
  List<DocumentRefListStruct> get initialInstrumentTestRefList =>
      _initialInstrumentTestRefList;
  set initialInstrumentTestRefList(List<DocumentRefListStruct> value) {
    _initialInstrumentTestRefList = value;
  }

  void addToInitialInstrumentTestRefList(DocumentRefListStruct value) {
    initialInstrumentTestRefList.add(value);
  }

  void removeFromInitialInstrumentTestRefList(DocumentRefListStruct value) {
    initialInstrumentTestRefList.remove(value);
  }

  void removeAtIndexFromInitialInstrumentTestRefList(int index) {
    initialInstrumentTestRefList.removeAt(index);
  }

  void updateInitialInstrumentTestRefListAtIndex(
    int index,
    DocumentRefListStruct Function(DocumentRefListStruct) updateFn,
  ) {
    initialInstrumentTestRefList[index] =
        updateFn(_initialInstrumentTestRefList[index]);
  }

  void insertAtIndexInInitialInstrumentTestRefList(
      int index, DocumentRefListStruct value) {
    initialInstrumentTestRefList.insert(index, value);
  }

  dynamic _jobsFromAPI;
  dynamic get jobsFromAPI => _jobsFromAPI;
  set jobsFromAPI(dynamic value) {
    _jobsFromAPI = value;
  }

  dynamic _sophisticatedInstruments;
  dynamic get sophisticatedInstruments => _sophisticatedInstruments;
  set sophisticatedInstruments(dynamic value) {
    _sophisticatedInstruments = value;
  }

  dynamic _InstrumentsTests;
  dynamic get InstrumentsTests => _InstrumentsTests;
  set InstrumentsTests(dynamic value) {
    _InstrumentsTests = value;
  }

  dynamic _toolsFromAPI;
  dynamic get toolsFromAPI => _toolsFromAPI;
  set toolsFromAPI(dynamic value) {
    _toolsFromAPI = value;
  }

  List<String> _jobLocationsList = [];
  List<String> get jobLocationsList => _jobLocationsList;
  set jobLocationsList(List<String> value) {
    _jobLocationsList = value;
  }

  void addToJobLocationsList(String value) {
    jobLocationsList.add(value);
  }

  void removeFromJobLocationsList(String value) {
    jobLocationsList.remove(value);
  }

  void removeAtIndexFromJobLocationsList(int index) {
    jobLocationsList.removeAt(index);
  }

  void updateJobLocationsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    jobLocationsList[index] = updateFn(_jobLocationsList[index]);
  }

  void insertAtIndexInJobLocationsList(int index, String value) {
    jobLocationsList.insert(index, value);
  }

  UserProfileDataStruct _userProfileData = UserProfileDataStruct();
  UserProfileDataStruct get userProfileData => _userProfileData;
  set userProfileData(UserProfileDataStruct value) {
    _userProfileData = value;
    secureStorage.setString('ff_userProfileData', value.serialize());
  }

  void deleteUserProfileData() {
    secureStorage.delete(key: 'ff_userProfileData');
  }

  void updateUserProfileDataStruct(Function(UserProfileDataStruct) updateFn) {
    updateFn(_userProfileData);
    secureStorage.setString('ff_userProfileData', _userProfileData.serialize());
  }

  String _debugString = '';
  String get debugString => _debugString;
  set debugString(String value) {
    _debugString = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
