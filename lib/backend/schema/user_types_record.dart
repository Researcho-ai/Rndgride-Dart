import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserTypesRecord extends FirestoreRecord {
  UserTypesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  void _initializeFields() {
    _userType = snapshotData['user_type'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user_types');

  static Stream<UserTypesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserTypesRecord.fromSnapshot(s));

  static Future<UserTypesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserTypesRecord.fromSnapshot(s));

  static UserTypesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserTypesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserTypesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserTypesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserTypesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserTypesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserTypesRecordData({
  String? userType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_type': userType,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserTypesRecordDocumentEquality implements Equality<UserTypesRecord> {
  const UserTypesRecordDocumentEquality();

  @override
  bool equals(UserTypesRecord? e1, UserTypesRecord? e2) {
    return e1?.userType == e2?.userType;
  }

  @override
  int hash(UserTypesRecord? e) => const ListEquality().hash([e?.userType]);

  @override
  bool isValidKey(Object? o) => o is UserTypesRecord;
}
