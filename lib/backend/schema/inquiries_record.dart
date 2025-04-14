import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InquiriesRecord extends FirestoreRecord {
  InquiriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "inquiry_subject" field.
  String? _inquirySubject;
  String get inquirySubject => _inquirySubject ?? '';
  bool hasInquirySubject() => _inquirySubject != null;

  // "inquiry_message" field.
  String? _inquiryMessage;
  String get inquiryMessage => _inquiryMessage ?? '';
  bool hasInquiryMessage() => _inquiryMessage != null;

  // "is_inquiry_seen" field.
  bool? _isInquirySeen;
  bool get isInquirySeen => _isInquirySeen ?? false;
  bool hasIsInquirySeen() => _isInquirySeen != null;

  // "inquiry_name" field.
  String? _inquiryName;
  String get inquiryName => _inquiryName ?? '';
  bool hasInquiryName() => _inquiryName != null;

  // "inquiry_email" field.
  String? _inquiryEmail;
  String get inquiryEmail => _inquiryEmail ?? '';
  bool hasInquiryEmail() => _inquiryEmail != null;

  // "inquiry_type" field.
  String? _inquiryType;
  String get inquiryType => _inquiryType ?? '';
  bool hasInquiryType() => _inquiryType != null;

  // "is_archived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _inquirySubject = snapshotData['inquiry_subject'] as String?;
    _inquiryMessage = snapshotData['inquiry_message'] as String?;
    _isInquirySeen = snapshotData['is_inquiry_seen'] as bool?;
    _inquiryName = snapshotData['inquiry_name'] as String?;
    _inquiryEmail = snapshotData['inquiry_email'] as String?;
    _inquiryType = snapshotData['inquiry_type'] as String?;
    _isArchived = snapshotData['is_archived'] as bool?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('inquiries');

  static Stream<InquiriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InquiriesRecord.fromSnapshot(s));

  static Future<InquiriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InquiriesRecord.fromSnapshot(s));

  static InquiriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InquiriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InquiriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InquiriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InquiriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InquiriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInquiriesRecordData({
  String? inquirySubject,
  String? inquiryMessage,
  bool? isInquirySeen,
  String? inquiryName,
  String? inquiryEmail,
  String? inquiryType,
  bool? isArchived,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'inquiry_subject': inquirySubject,
      'inquiry_message': inquiryMessage,
      'is_inquiry_seen': isInquirySeen,
      'inquiry_name': inquiryName,
      'inquiry_email': inquiryEmail,
      'inquiry_type': inquiryType,
      'is_archived': isArchived,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class InquiriesRecordDocumentEquality implements Equality<InquiriesRecord> {
  const InquiriesRecordDocumentEquality();

  @override
  bool equals(InquiriesRecord? e1, InquiriesRecord? e2) {
    return e1?.inquirySubject == e2?.inquirySubject &&
        e1?.inquiryMessage == e2?.inquiryMessage &&
        e1?.isInquirySeen == e2?.isInquirySeen &&
        e1?.inquiryName == e2?.inquiryName &&
        e1?.inquiryEmail == e2?.inquiryEmail &&
        e1?.inquiryType == e2?.inquiryType &&
        e1?.isArchived == e2?.isArchived &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(InquiriesRecord? e) => const ListEquality().hash([
        e?.inquirySubject,
        e?.inquiryMessage,
        e?.isInquirySeen,
        e?.inquiryName,
        e?.inquiryEmail,
        e?.inquiryType,
        e?.isArchived,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is InquiriesRecord;
}
