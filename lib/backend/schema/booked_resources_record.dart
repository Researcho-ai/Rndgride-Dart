import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookedResourcesRecord extends FirestoreRecord {
  BookedResourcesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "instrument_test_ref" field.
  DocumentReference? _instrumentTestRef;
  DocumentReference? get instrumentTestRef => _instrumentTestRef;
  bool hasInstrumentTestRef() => _instrumentTestRef != null;

  // "sample_quantity" field.
  String? _sampleQuantity;
  String get sampleQuantity => _sampleQuantity ?? '';
  bool hasSampleQuantity() => _sampleQuantity != null;

  // "bill_amount" field.
  String? _billAmount;
  String get billAmount => _billAmount ?? '';
  bool hasBillAmount() => _billAmount != null;

  // "analysis_name" field.
  String? _analysisName;
  String get analysisName => _analysisName ?? '';
  bool hasAnalysisName() => _analysisName != null;

  // "solvent_method_name" field.
  String? _solventMethodName;
  String get solventMethodName => _solventMethodName ?? '';
  bool hasSolventMethodName() => _solventMethodName != null;

  // "booking_time" field.
  DateTime? _bookingTime;
  DateTime? get bookingTime => _bookingTime;
  bool hasBookingTime() => _bookingTime != null;

  // "is_archived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "is_seen" field.
  bool? _isSeen;
  bool get isSeen => _isSeen ?? false;
  bool hasIsSeen() => _isSeen != null;

  // "plateform_fees" field.
  String? _plateformFees;
  String get plateformFees => _plateformFees ?? '';
  bool hasPlateformFees() => _plateformFees != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _instrumentTestRef =
        snapshotData['instrument_test_ref'] as DocumentReference?;
    _sampleQuantity = snapshotData['sample_quantity'] as String?;
    _billAmount = snapshotData['bill_amount'] as String?;
    _analysisName = snapshotData['analysis_name'] as String?;
    _solventMethodName = snapshotData['solvent_method_name'] as String?;
    _bookingTime = snapshotData['booking_time'] as DateTime?;
    _isArchived = snapshotData['is_archived'] as bool?;
    _isSeen = snapshotData['is_seen'] as bool?;
    _plateformFees = snapshotData['plateform_fees'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('booked_resources')
          : FirebaseFirestore.instance.collectionGroup('booked_resources');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('booked_resources').doc(id);

  static Stream<BookedResourcesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookedResourcesRecord.fromSnapshot(s));

  static Future<BookedResourcesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookedResourcesRecord.fromSnapshot(s));

  static BookedResourcesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookedResourcesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookedResourcesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookedResourcesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookedResourcesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookedResourcesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookedResourcesRecordData({
  DocumentReference? instrumentTestRef,
  String? sampleQuantity,
  String? billAmount,
  String? analysisName,
  String? solventMethodName,
  DateTime? bookingTime,
  bool? isArchived,
  bool? isSeen,
  String? plateformFees,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'instrument_test_ref': instrumentTestRef,
      'sample_quantity': sampleQuantity,
      'bill_amount': billAmount,
      'analysis_name': analysisName,
      'solvent_method_name': solventMethodName,
      'booking_time': bookingTime,
      'is_archived': isArchived,
      'is_seen': isSeen,
      'plateform_fees': plateformFees,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookedResourcesRecordDocumentEquality
    implements Equality<BookedResourcesRecord> {
  const BookedResourcesRecordDocumentEquality();

  @override
  bool equals(BookedResourcesRecord? e1, BookedResourcesRecord? e2) {
    return e1?.instrumentTestRef == e2?.instrumentTestRef &&
        e1?.sampleQuantity == e2?.sampleQuantity &&
        e1?.billAmount == e2?.billAmount &&
        e1?.analysisName == e2?.analysisName &&
        e1?.solventMethodName == e2?.solventMethodName &&
        e1?.bookingTime == e2?.bookingTime &&
        e1?.isArchived == e2?.isArchived &&
        e1?.isSeen == e2?.isSeen &&
        e1?.plateformFees == e2?.plateformFees;
  }

  @override
  int hash(BookedResourcesRecord? e) => const ListEquality().hash([
        e?.instrumentTestRef,
        e?.sampleQuantity,
        e?.billAmount,
        e?.analysisName,
        e?.solventMethodName,
        e?.bookingTime,
        e?.isArchived,
        e?.isSeen,
        e?.plateformFees
      ]);

  @override
  bool isValidKey(Object? o) => o is BookedResourcesRecord;
}
