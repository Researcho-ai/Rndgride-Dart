import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToolsRecord extends FirestoreRecord {
  ToolsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tool_logo" field.
  String? _toolLogo;
  String get toolLogo => _toolLogo ?? '';
  bool hasToolLogo() => _toolLogo != null;

  // "tool_name" field.
  String? _toolName;
  String get toolName => _toolName ?? '';
  bool hasToolName() => _toolName != null;

  // "tool_description" field.
  String? _toolDescription;
  String get toolDescription => _toolDescription ?? '';
  bool hasToolDescription() => _toolDescription != null;

  // "visiters_count" field.
  int? _visitersCount;
  int get visitersCount => _visitersCount ?? 0;
  bool hasVisitersCount() => _visitersCount != null;

  // "tool_url" field.
  String? _toolUrl;
  String get toolUrl => _toolUrl ?? '';
  bool hasToolUrl() => _toolUrl != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes_count" field.
  List<DocumentReference>? _likesCount;
  List<DocumentReference> get likesCount => _likesCount ?? const [];
  bool hasLikesCount() => _likesCount != null;

  void _initializeFields() {
    _toolLogo = snapshotData['tool_logo'] as String?;
    _toolName = snapshotData['tool_name'] as String?;
    _toolDescription = snapshotData['tool_description'] as String?;
    _visitersCount = castToType<int>(snapshotData['visiters_count']);
    _toolUrl = snapshotData['tool_url'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likesCount = getDataList(snapshotData['likes_count']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tools');

  static Stream<ToolsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToolsRecord.fromSnapshot(s));

  static Future<ToolsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToolsRecord.fromSnapshot(s));

  static ToolsRecord fromSnapshot(DocumentSnapshot snapshot) => ToolsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToolsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToolsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToolsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToolsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToolsRecordData({
  String? toolLogo,
  String? toolName,
  String? toolDescription,
  int? visitersCount,
  String? toolUrl,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tool_logo': toolLogo,
      'tool_name': toolName,
      'tool_description': toolDescription,
      'visiters_count': visitersCount,
      'tool_url': toolUrl,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToolsRecordDocumentEquality implements Equality<ToolsRecord> {
  const ToolsRecordDocumentEquality();

  @override
  bool equals(ToolsRecord? e1, ToolsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.toolLogo == e2?.toolLogo &&
        e1?.toolName == e2?.toolName &&
        e1?.toolDescription == e2?.toolDescription &&
        e1?.visitersCount == e2?.visitersCount &&
        e1?.toolUrl == e2?.toolUrl &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likesCount, e2?.likesCount);
  }

  @override
  int hash(ToolsRecord? e) => const ListEquality().hash([
        e?.toolLogo,
        e?.toolName,
        e?.toolDescription,
        e?.visitersCount,
        e?.toolUrl,
        e?.createdTime,
        e?.likesCount
      ]);

  @override
  bool isValidKey(Object? o) => o is ToolsRecord;
}
