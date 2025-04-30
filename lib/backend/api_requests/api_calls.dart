import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'search';

/// Start Labs Group Code

class LabsGroup {
  static String getBaseUrl() => 'https://js.rndgrid.com/api/labs/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetLabsCall getLabsCall = GetLabsCall();
  static FetchLabOptionsCall fetchLabOptionsCall = FetchLabOptionsCall();
  static LabOptionPageListCall labOptionPageListCall = LabOptionPageListCall();
  static FilterLabOptionsCall filterLabOptionsCall = FilterLabOptionsCall();
  static LabResourcesCall labResourcesCall = LabResourcesCall();
}

class GetLabsCall {
  Future<ApiCallResponse> call({
    String? searchTerm = '',
  }) async {
    final baseUrl = LabsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Labs',
      apiUrl: '${baseUrl}getLabs',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': searchTerm,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic labs(dynamic response) => getJsonField(
        response,
        r'''$.labs''',
      );
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class FetchLabOptionsCall {
  Future<ApiCallResponse> call({
    String? instrumentTestListRef = '',
  }) async {
    final baseUrl = LabsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "instrumentTestListRef": "${instrumentTestListRef}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Lab Options',
      apiUrl: '${baseUrl}lab_options',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instrumentList(dynamic response) => getJsonField(
        response,
        r'''$.ValidInstruments''',
      );
  List<String>? solventMethodName(dynamic response) => (getJsonField(
        response,
        r'''$.ValidInstruments[:].solvent_method_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class LabOptionPageListCall {
  Future<ApiCallResponse> call({
    String? instrumentTestListRef = '',
  }) async {
    final baseUrl = LabsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "instrumentTestListRef": "${instrumentTestListRef}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Lab Option Page List',
      apiUrl: '${baseUrl}lists',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? citiesListJson(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city_list.Cities''',
      ));
  List<String>? analysisList(dynamic response) => (getJsonField(
        response,
        r'''$.analysisList.AnalysisNames''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? soventList(dynamic response) => (getJsonField(
        response,
        r'''$.solventList.AnalysisNames''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? otherDetailList(dynamic response) => (getJsonField(
        response,
        r'''$.otherDetailList.AnalysisNames''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? citiesList(dynamic response) => (getJsonField(
        response,
        r'''$.city_list.Cities[:].city_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class FilterLabOptionsCall {
  Future<ApiCallResponse> call({
    String? instrumentTestListRef = '',
    String? phoneNumber = '',
    String? analysisName = '',
    String? solventMethodName = '',
    String? citiesRef = '',
    bool? visitPerson,
    String? duration = '',
  }) async {
    final baseUrl = LabsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Filter Lab Options',
      apiUrl: '${baseUrl}filter-instruments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'instrumentTestListRef': instrumentTestListRef,
        'phoneNumber': phoneNumber,
        'citiesRef': citiesRef,
        'solventMethodName': solventMethodName,
        'duration': duration,
        'analysisName': analysisName,
        'vigitPerson': visitPerson,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instrument(dynamic response) => getJsonField(
        response,
        r'''$.ValidInstruments''',
      );
  dynamic parameters(dynamic response) => getJsonField(
        response,
        r'''$.Parameters''',
      );
  bool? emptyResponce(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.empty_responce''',
      ));
}

class LabResourcesCall {
  Future<ApiCallResponse> call({
    String? labID = '',
    int? limit,
  }) async {
    final baseUrl = LabsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "labID": "${labID}",
  "limit": ${limit}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'labResources',
      apiUrl: '${baseUrl}labResources',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instrument(dynamic response) => getJsonField(
        response,
        r'''$.instruments''',
      );
  List? instrumentProperties(dynamic response) => getJsonField(
        response,
        r'''$.instruments[:].instrument_properties''',
        true,
      ) as List?;
}

/// End Labs Group Code

/// Start Instruments Tests Group Code

class InstrumentsTestsGroup {
  static String getBaseUrl() => 'https://js.rndgrid.com/api/instruments/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetInstrumentsTestsCall getInstrumentsTestsCall =
      GetInstrumentsTestsCall();
  static SearchInstrumentTestCall searchInstrumentTestCall =
      SearchInstrumentTestCall();
  static GetSophisticatedInstrumentsTestsCall
      getSophisticatedInstrumentsTestsCall =
      GetSophisticatedInstrumentsTestsCall();
  static FetchInstrumentTestListCall fetchInstrumentTestListCall =
      FetchInstrumentTestListCall();
  static GetInstrumentPropertiesCall getInstrumentPropertiesCall =
      GetInstrumentPropertiesCall();
  static InstrumentSuggestionsCall instrumentSuggestionsCall =
      InstrumentSuggestionsCall();
}

class GetInstrumentsTestsCall {
  Future<ApiCallResponse> call({
    int? limit,
    bool? filteredValue = true,
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Instruments Tests',
      apiUrl: '${baseUrl}getInstruments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'limit': limit,
        'filtered_value': filteredValue,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instrumentsTests(dynamic response) => getJsonField(
        response,
        r'''$.instruments''',
      );
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class SearchInstrumentTestCall {
  Future<ApiCallResponse> call({
    String? search = '',
    int? limit,
    bool? sophisticatedSearch,
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Search Instrument  Test',
      apiUrl: '${baseUrl}searchInstruments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': search,
        'limit': limit,
        'sophisticated_search': sophisticatedSearch,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? instruments(dynamic response) => getJsonField(
        response,
        r'''$.instruments''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class GetSophisticatedInstrumentsTestsCall {
  Future<ApiCallResponse> call({
    int? limit,
    bool? filteredValue = true,
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get Sophisticated Instruments Tests',
      apiUrl: '${baseUrl}getSophisticatedInstruments',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'limit': limit,
        'filtered_value': filteredValue,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instruments(dynamic response) => getJsonField(
        response,
        r'''$.instruments''',
      );
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class FetchInstrumentTestListCall {
  Future<ApiCallResponse> call({
    String? instrumentRef = '',
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Fetch Instrument Test List',
      apiUrl: '${baseUrl}getInstrumentAnalysisAndSolvents',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'instrument_ref': instrumentRef,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? lengthOfList(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.length''',
      ));
  List? instrumentTestList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class GetInstrumentPropertiesCall {
  Future<ApiCallResponse> call({
    String? instrumentID = '',
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "instrumentID": "${instrumentID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getInstrumentProperties',
      apiUrl: '${baseUrl}getInstrumentProperties',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic instrumentProperties(dynamic response) => getJsonField(
        response,
        r'''$.instrument_properties''',
      );
  bool? industrialBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.industrial_price''',
      ));
  bool? otherdetailBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.other_details''',
      ));
  bool? applicationBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.application''',
      ));
  bool? academicBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.academic_price''',
      ));
  bool? analysisBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.analysis_name''',
      ));
  bool? solventBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.solvent_method_name''',
      ));
  bool? internalBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.internal_price''',
      ));
  bool? sampleBool(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.fieldsPresence.sample_quantity''',
      ));
  dynamic presentFields(dynamic response) => getJsonField(
        response,
        r'''$.fieldsPresence''',
      );
}

class InstrumentSuggestionsCall {
  Future<ApiCallResponse> call({
    String? searchTerm = '',
    bool? sophisticatedSearch = false,
  }) async {
    final baseUrl = InstrumentsTestsGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Instrument suggestions',
      apiUrl: '${baseUrl}suggestions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': searchTerm,
        'sophisticated_search': sophisticatedSearch,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? suggetion(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

/// End Instruments Tests Group Code

/// Start Users Group Code

class UsersGroup {
  static String getBaseUrl() => 'https://js.rndgrid.com/api/users/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateUserRequestCall createUserRequestCall = CreateUserRequestCall();
  static GetUserDataCall getUserDataCall = GetUserDataCall();
  static UpdateUserProfileAtAuthCall updateUserProfileAtAuthCall =
      UpdateUserProfileAtAuthCall();
  static UpdateUserImageCall updateUserImageCall = UpdateUserImageCall();
  static UpdateUserProfileTwoCall updateUserProfileTwoCall =
      UpdateUserProfileTwoCall();
  static CreateUserCall createUserCall = CreateUserCall();
  static AddUserBookingCall addUserBookingCall = AddUserBookingCall();
  static UpdateUserProfileStepOneCall updateUserProfileStepOneCall =
      UpdateUserProfileStepOneCall();
  static GetUserTyCall getUserTyCall = GetUserTyCall();
  static UoploadImageCall uoploadImageCall = UoploadImageCall();
}

class CreateUserRequestCall {
  Future<ApiCallResponse> call({
    String? inquiryMessage = '',
    String? userType = '',
    String? inquirySubject = '',
    String? userID = '',
    String? phoneNumber = '',
    String? userName = '',
    String? neededIn = '',
    String? inquiryType = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "inquiryMessage": "${inquiryMessage}",
  "userType": "${userType}",
  "inquirySubject": "${inquirySubject}",
  "userID": "${userID}",
  "phoneNumber": "${phoneNumber}",
  "userName": "${userName}",
  "neededIn": "${neededIn}",
  "inquiryType": "${inquiryType}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create User Request',
      apiUrl: '${baseUrl}createInquiry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserDataCall {
  Future<ApiCallResponse> call({
    String? userID = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Get User Data',
      apiUrl: '${baseUrl}getUserDetails',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'userID': userID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? phoneNo(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.phone_number''',
      ));
  String? displayName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.display_name''',
      ));
  String? userType(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_type''',
      ));
  String? researchField(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_research_field''',
      ));
  String? affiliation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_affiliation''',
      ));
  String? uid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user_id''',
      ));
}

class UpdateUserProfileAtAuthCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? displayName = '',
    String? userType = '',
    String? userResearchField = '',
    String? userAffiliation = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userID": "${userId}",
  "displayName": "${displayName}",
  "userType": "${userType}",
  "userAffiliation": "${userAffiliation}",
  "userResearchField":"${userResearchField}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile At Auth',
      apiUrl: '${baseUrl}updateUserDetailsAtAuth',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserImageCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? imageUrl = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userID": "${userId}",
  "imageURL": "${imageUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Image',
      apiUrl: '${baseUrl}updateUserImage',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileTwoCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? userAffiliation = '',
    String? userResearchField = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userID": "${userId}",
  "userAffiliation": "${userAffiliation}",
  "userResearchField": "${userResearchField}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update User Profile Two',
      apiUrl: '${baseUrl}updateUserDetails2',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateUserCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? displayName = '',
    String? userType = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Create User',
      apiUrl: '${baseUrl}createUser',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddUserBookingCall {
  Future<ApiCallResponse> call({
    String? billAmount = '',
    String? plateformFees = '',
    String? instrumentTestRef = '',
    String? analysisName = '',
    String? solventMethodName = '',
    String? sampleQuantity = '',
    String? userID = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "bill_amount": "${billAmount}",
  "plateform_fees": "${plateformFees}",
  "instrument_test_ref": "${instrumentTestRef}",
  "analysis_name": "${analysisName}",
  "solvent_method_name": "${solventMethodName}",
  "sample_quantity": "${sampleQuantity}",
  "userID": "${userID}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add user booking',
      apiUrl: '${baseUrl}addUserBooking',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileStepOneCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? displayName = '',
    String? userType = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "userType": "${userType}",
  "userID": "${userID}",
  "displayName": "${displayName}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update User  Profile step one',
      apiUrl: '${baseUrl}updateUserDetails1',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserTyCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = UsersGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'get user ty',
      apiUrl: '${baseUrl}getUserTypesNameList',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? userTypeList(dynamic response) => (getJsonField(
        response,
        r'''$.userTypes''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class UoploadImageCall {
  Future<ApiCallResponse> call({
    String? image = '',
  }) async {
    final baseUrl = UsersGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "image": "${image}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'uoploadImage',
      apiUrl: '${baseUrl}uploadImage',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? imageUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
}

/// End Users Group Code

/// Start Authenticaton Group Code

class AuthenticatonGroup {
  static String getBaseUrl() => 'https://js.rndgrid.com/auth';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static SendOtpCall sendOtpCall = SendOtpCall();
  static VerifyOtpCall verifyOtpCall = VerifyOtpCall();
}

class SendOtpCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
  }) async {
    final baseUrl = AuthenticatonGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneNumber}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendOtp',
      apiUrl: '${baseUrl}/sign-up',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? session(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.session''',
      ));
  bool? isUserExist(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.userExists''',
      ));
}

class VerifyOtpCall {
  Future<ApiCallResponse> call({
    String? phoneNumber = '',
    String? otp = '',
    String? session = '',
  }) async {
    final baseUrl = AuthenticatonGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "phoneNumber": "${phoneNumber}",
  "otp": "${otp}",
  "session": "${session}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyOtp',
      apiUrl: '${baseUrl}/verify-otp',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic userData(dynamic response) => getJsonField(
        response,
        r'''$.user''',
      );
  String? jWTtoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
  String? userID(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user._id''',
      ));
  String? uid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.uid''',
      ));
  String? phoneNumber(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.phone_number''',
      ));
  bool? profileStatus(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.user.user_profile_status''',
      ));
  String? photoUrl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.photo_url''',
      ));
  String? displayName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.display_name''',
      ));
  String? usertype(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.user_type''',
      ));
  String? responseMessage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.email''',
      ));
  String? researchField(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.user_research_field''',
      ));
  String? affiliation(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.user.user_affiliation''',
      ));
  String? requeredResources(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.user.user_required_resources''',
      ));
  String? refreshToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.rt''',
      ));
  bool? isNewUser(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.new_user''',
      ));
}

/// End Authenticaton Group Code

/// Start Inquery Group Code

class InqueryGroup {
  static String getBaseUrl({
    String? userID = '',
    String? subType = '',
    String? instrumentRef = '',
    dynamic testDetailsListJson,
    String? sampleQuantity = '',
    String? neededIn = '',
    String? inquiryMessage = '',
    String? phoneNumber = '',
    String? userName = '',
    String? inquirySubject = '',
    String? userType = '',
  }) =>
      'https://js.rndgrid.com/api/inquiry/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static CreateBookingCall createBookingCall = CreateBookingCall();
  static CreateTestBookingCall createTestBookingCall = CreateTestBookingCall();
  static CreateInqueryCall createInqueryCall = CreateInqueryCall();
}

class CreateBookingCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? subType = '',
    String? instrumentRef = '',
    dynamic testDetailsListJson,
    String? sampleQuantity = '',
    String? neededIn = '',
    String? inquiryMessage = '',
    String? phoneNumber = '',
    String? userName = '',
    String? inquirySubject = '',
    String? userType = '',
  }) async {
    final baseUrl = InqueryGroup.getBaseUrl(
      userID: userID,
      subType: subType,
      instrumentRef: instrumentRef,
      testDetailsListJson: testDetailsListJson,
      sampleQuantity: sampleQuantity,
      neededIn: neededIn,
      inquiryMessage: inquiryMessage,
      phoneNumber: phoneNumber,
      userName: userName,
      inquirySubject: inquirySubject,
      userType: userType,
    );

    final testDetailsList = _serializeJson(testDetailsListJson, true);
    final ffApiRequestBody = '''
{
  "userID": "${escapeStringForJson(userID)}",
  "subType": "${escapeStringForJson(subType)}",
  "instrument_ref": "${escapeStringForJson(instrumentRef)}",
  "test_details_list": ${testDetailsList},
  "sample_quantity": "${escapeStringForJson(sampleQuantity)}",
  "needed_in": "${escapeStringForJson(neededIn)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createBooking',
      apiUrl: '${baseUrl}createResourceBooking',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTestBookingCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? subType = '',
    String? instrumentRef = '',
    dynamic testDetailsListJson,
    String? sampleQuantity = '',
    String? neededIn = '',
    String? inquiryMessage = '',
    String? phoneNumber = '',
    String? userName = '',
    String? inquirySubject = '',
    String? userType = '',
  }) async {
    final baseUrl = InqueryGroup.getBaseUrl(
      userID: userID,
      subType: subType,
      instrumentRef: instrumentRef,
      testDetailsListJson: testDetailsListJson,
      sampleQuantity: sampleQuantity,
      neededIn: neededIn,
      inquiryMessage: inquiryMessage,
      phoneNumber: phoneNumber,
      userName: userName,
      inquirySubject: inquirySubject,
      userType: userType,
    );

    final testDetailsList = _serializeJson(testDetailsListJson, true);
    final ffApiRequestBody = '''
{
  "userID": "${escapeStringForJson(userID)}",
  "subType": "${escapeStringForJson(subType)}",
  "instrument_ref": "${escapeStringForJson(instrumentRef)}",
  "test_details_list": ${testDetailsList},
  "sample_quantity": "${escapeStringForJson(sampleQuantity)}",
  "needed_in": "${escapeStringForJson(neededIn)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Test Booking',
      apiUrl: '${baseUrl}createTestResourceBooking',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateInqueryCall {
  Future<ApiCallResponse> call({
    String? userID = '',
    String? subType = '',
    String? instrumentRef = '',
    dynamic testDetailsListJson,
    String? sampleQuantity = '',
    String? neededIn = '',
    String? inquiryMessage = '',
    String? phoneNumber = '',
    String? userName = '',
    String? inquirySubject = '',
    String? userType = '',
  }) async {
    final baseUrl = InqueryGroup.getBaseUrl(
      userID: userID,
      subType: subType,
      instrumentRef: instrumentRef,
      testDetailsListJson: testDetailsListJson,
      sampleQuantity: sampleQuantity,
      neededIn: neededIn,
      inquiryMessage: inquiryMessage,
      phoneNumber: phoneNumber,
      userName: userName,
      inquirySubject: inquirySubject,
      userType: userType,
    );

    final testDetailsList = _serializeJson(testDetailsListJson, true);
    final ffApiRequestBody = '''
{
  "inquiryMessage": "${escapeStringForJson(inquiryMessage)}",
  "userType": "${escapeStringForJson(userType)}",
  "inquirySubject": "${escapeStringForJson(inquirySubject)}",
  "userID": "${escapeStringForJson(userID)}",
  "phoneNumber": "${escapeStringForJson(phoneNumber)}",
  "userName": "${escapeStringForJson(userName)}",
  "neededIn": "${escapeStringForJson(neededIn)}",
  "subType": "${escapeStringForJson(subType)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createInquery',
      apiUrl: '${baseUrl}createInquiry',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Inquery Group Code

/// Start Tests Group Code

class TestsGroup {
  static String getBaseUrl({
    String? fieldRef = '',
  }) =>
      'https://js.rndgrid.com/api/test/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GetFiedsCall getFiedsCall = GetFiedsCall();
  static GetAvailabeTestPropetiesCall getAvailabeTestPropetiesCall =
      GetAvailabeTestPropetiesCall();
  static SearchTestCall searchTestCall = SearchTestCall();
  static TestSuggestionCall testSuggestionCall = TestSuggestionCall();
  static GetCategoriesCall getCategoriesCall = GetCategoriesCall();
}

class GetFiedsCall {
  Future<ApiCallResponse> call({
    int? limit,
    String? categoryRef = '',
    String? fieldRef = '',
  }) async {
    final baseUrl = TestsGroup.getBaseUrl(
      fieldRef: fieldRef,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Fieds',
      apiUrl: '${baseUrl}getFields',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'limit': limit,
        'category_ref': categoryRef,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? fields(dynamic response) => getJsonField(
        response,
        r'''$.fields''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

class GetAvailabeTestPropetiesCall {
  Future<ApiCallResponse> call({
    String? fieldRef = '',
  }) async {
    final baseUrl = TestsGroup.getBaseUrl(
      fieldRef: fieldRef,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Availabe Test Propeties',
      apiUrl: '${baseUrl}getAvailableTestProperties',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'field_ref': fieldRef,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
  List? data(dynamic response) => getJsonField(
        response,
        r'''$.fields''',
        true,
      ) as List?;
}

class SearchTestCall {
  Future<ApiCallResponse> call({
    String? searchTerm = '',
    int? limit = 10,
    String? fieldRef = '',
  }) async {
    final baseUrl = TestsGroup.getBaseUrl(
      fieldRef: fieldRef,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Search Test',
      apiUrl: '${baseUrl}searchTest',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': searchTerm,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? searchResult(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      ) as List?;
}

class TestSuggestionCall {
  Future<ApiCallResponse> call({
    String? searchTerm = '',
    int? limit = 10,
    String? fieldRef = '',
  }) async {
    final baseUrl = TestsGroup.getBaseUrl(
      fieldRef: fieldRef,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Test Suggestion',
      apiUrl: '${baseUrl}suggestions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': searchTerm,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? suggetoins(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetCategoriesCall {
  Future<ApiCallResponse> call({
    int? limit,
    bool? filteredValue = true,
    String? fieldRef = '',
  }) async {
    final baseUrl = TestsGroup.getBaseUrl(
      fieldRef: fieldRef,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Get Categories',
      apiUrl: '${baseUrl}getCategories',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'limit': limit,
        'filtered_value': filteredValue,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? categories(dynamic response) => getJsonField(
        response,
        r'''$.categories''',
        true,
      ) as List?;
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

/// End Tests Group Code

/// Start Admin Group Code

class AdminGroup {
  static String getBaseUrl() => 'https://js.rndgrid.com/api/admin/';
  static Map<String, String> headers = {
    'Content-Type': 'application/json',
  };
  static GlobalSuggetionCall globalSuggetionCall = GlobalSuggetionCall();
}

class GlobalSuggetionCall {
  Future<ApiCallResponse> call({
    String? searchTerm = '',
  }) async {
    final baseUrl = AdminGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Global Suggetion',
      apiUrl: '${baseUrl}global-suggestions',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {
        'searchTerm': searchTerm,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? globalSuggetion(dynamic response) => (getJsonField(
        response,
        r'''$.suggestions''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? count(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.count''',
      ));
}

/// End Admin Group Code

class SendMailToAdminCall {
  static Future<ApiCallResponse> call({
    String? userName = '',
    String? mobileNumber = '',
    String? userType = '',
    String? userRequirement = '',
    String? whenNeed = '',
    String? tag = '',
  }) async {
    final ffApiRequestBody = '''
{
  "username": "${userName}",
  "userMobile": "${mobileNumber}",
  "userType": "${userType}",
  "userRequirement": "${userRequirement}",
  "needByDate": "${whenNeed}",
  "requirementSource": "${tag}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'send mail to admin',
      apiUrl: 'https://node.researcho.ai/mail/send',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
