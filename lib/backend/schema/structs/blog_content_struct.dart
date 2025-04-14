// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BlogContentStruct extends FFFirebaseStruct {
  BlogContentStruct({
    String? type,
    String? data,
    String? imagepath,
    String? header,
    String? text,
    int? index,
    int? textSize,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _data = data,
        _imagepath = imagepath,
        _header = header,
        _text = text,
        _index = index,
        _textSize = textSize,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "data" field.
  String? _data;
  String get data => _data ?? '';
  set data(String? val) => _data = val;

  bool hasData() => _data != null;

  // "imagepath" field.
  String? _imagepath;
  String get imagepath => _imagepath ?? '';
  set imagepath(String? val) => _imagepath = val;

  bool hasImagepath() => _imagepath != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  set header(String? val) => _header = val;

  bool hasHeader() => _header != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;

  void incrementIndex(int amount) => index = index + amount;

  bool hasIndex() => _index != null;

  // "text_size" field.
  int? _textSize;
  int get textSize => _textSize ?? 0;
  set textSize(int? val) => _textSize = val;

  void incrementTextSize(int amount) => textSize = textSize + amount;

  bool hasTextSize() => _textSize != null;

  static BlogContentStruct fromMap(Map<String, dynamic> data) =>
      BlogContentStruct(
        type: data['type'] as String?,
        data: data['data'] as String?,
        imagepath: data['imagepath'] as String?,
        header: data['header'] as String?,
        text: data['text'] as String?,
        index: castToType<int>(data['index']),
        textSize: castToType<int>(data['text_size']),
      );

  static BlogContentStruct? maybeFromMap(dynamic data) => data is Map
      ? BlogContentStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'data': _data,
        'imagepath': _imagepath,
        'header': _header,
        'text': _text,
        'index': _index,
        'text_size': _textSize,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'data': serializeParam(
          _data,
          ParamType.String,
        ),
        'imagepath': serializeParam(
          _imagepath,
          ParamType.String,
        ),
        'header': serializeParam(
          _header,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'text_size': serializeParam(
          _textSize,
          ParamType.int,
        ),
      }.withoutNulls;

  static BlogContentStruct fromSerializableMap(Map<String, dynamic> data) =>
      BlogContentStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        data: deserializeParam(
          data['data'],
          ParamType.String,
          false,
        ),
        imagepath: deserializeParam(
          data['imagepath'],
          ParamType.String,
          false,
        ),
        header: deserializeParam(
          data['header'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        textSize: deserializeParam(
          data['text_size'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'BlogContentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BlogContentStruct &&
        type == other.type &&
        data == other.data &&
        imagepath == other.imagepath &&
        header == other.header &&
        text == other.text &&
        index == other.index &&
        textSize == other.textSize;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([type, data, imagepath, header, text, index, textSize]);
}

BlogContentStruct createBlogContentStruct({
  String? type,
  String? data,
  String? imagepath,
  String? header,
  String? text,
  int? index,
  int? textSize,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BlogContentStruct(
      type: type,
      data: data,
      imagepath: imagepath,
      header: header,
      text: text,
      index: index,
      textSize: textSize,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BlogContentStruct? updateBlogContentStruct(
  BlogContentStruct? blogContent, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    blogContent
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBlogContentStructData(
  Map<String, dynamic> firestoreData,
  BlogContentStruct? blogContent,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (blogContent == null) {
    return;
  }
  if (blogContent.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && blogContent.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final blogContentData =
      getBlogContentFirestoreData(blogContent, forFieldValue);
  final nestedData =
      blogContentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = blogContent.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBlogContentFirestoreData(
  BlogContentStruct? blogContent, [
  bool forFieldValue = false,
]) {
  if (blogContent == null) {
    return {};
  }
  final firestoreData = mapToFirestore(blogContent.toMap());

  // Add any Firestore field values
  blogContent.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBlogContentListFirestoreData(
  List<BlogContentStruct>? blogContents,
) =>
    blogContents?.map((e) => getBlogContentFirestoreData(e, true)).toList() ??
    [];
