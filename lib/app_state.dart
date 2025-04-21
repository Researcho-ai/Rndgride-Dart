import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  dynamic _sophisticatedInstruments;
  dynamic get sophisticatedInstruments => _sophisticatedInstruments;
  set sophisticatedInstruments(dynamic value) {
    _sophisticatedInstruments = value;
  }

  dynamic _InstrumentsList;
  dynamic get InstrumentsList => _InstrumentsList;
  set InstrumentsList(dynamic value) {
    _InstrumentsList = value;
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

  List<dynamic> _testsList = [];
  List<dynamic> get testsList => _testsList;
  set testsList(List<dynamic> value) {
    _testsList = value;
  }

  void addToTestsList(dynamic value) {
    testsList.add(value);
  }

  void removeFromTestsList(dynamic value) {
    testsList.remove(value);
  }

  void removeAtIndexFromTestsList(int index) {
    testsList.removeAt(index);
  }

  void updateTestsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    testsList[index] = updateFn(_testsList[index]);
  }

  void insertAtIndexInTestsList(int index, dynamic value) {
    testsList.insert(index, value);
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
