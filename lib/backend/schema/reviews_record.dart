import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_stamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  // "lab_ref" field.
  DocumentReference? _labRef;
  DocumentReference? get labRef => _labRef;
  bool hasLabRef() => _labRef != null;

  // "overall_rating" field.
  double? _overallRating;
  double get overallRating => _overallRating ?? 0.0;
  bool hasOverallRating() => _overallRating != null;

  // "accuracy_rating" field.
  double? _accuracyRating;
  double get accuracyRating => _accuracyRating ?? 0.0;
  bool hasAccuracyRating() => _accuracyRating != null;

  // "communication_rating" field.
  double? _communicationRating;
  double get communicationRating => _communicationRating ?? 0.0;
  bool hasCommunicationRating() => _communicationRating != null;

  // "on_time_rating" field.
  double? _onTimeRating;
  double get onTimeRating => _onTimeRating ?? 0.0;
  bool hasOnTimeRating() => _onTimeRating != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "review_description" field.
  String? _reviewDescription;
  String get reviewDescription => _reviewDescription ?? '';
  bool hasReviewDescription() => _reviewDescription != null;

  // "instrument_ref" field.
  DocumentReference? _instrumentRef;
  DocumentReference? get instrumentRef => _instrumentRef;
  bool hasInstrumentRef() => _instrumentRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeStamp = snapshotData['time_stamp'] as DateTime?;
    _labRef = snapshotData['lab_ref'] as DocumentReference?;
    _overallRating = castToType<double>(snapshotData['overall_rating']);
    _accuracyRating = castToType<double>(snapshotData['accuracy_rating']);
    _communicationRating =
        castToType<double>(snapshotData['communication_rating']);
    _onTimeRating = castToType<double>(snapshotData['on_time_rating']);
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _reviewDescription = snapshotData['review_description'] as String?;
    _instrumentRef = snapshotData['instrument_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reviews')
          : FirebaseFirestore.instance.collectionGroup('reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DateTime? timeStamp,
  DocumentReference? labRef,
  double? overallRating,
  double? accuracyRating,
  double? communicationRating,
  double? onTimeRating,
  DocumentReference? userRef,
  String? reviewDescription,
  DocumentReference? instrumentRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_stamp': timeStamp,
      'lab_ref': labRef,
      'overall_rating': overallRating,
      'accuracy_rating': accuracyRating,
      'communication_rating': communicationRating,
      'on_time_rating': onTimeRating,
      'user_ref': userRef,
      'review_description': reviewDescription,
      'instrument_ref': instrumentRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.timeStamp == e2?.timeStamp &&
        e1?.labRef == e2?.labRef &&
        e1?.overallRating == e2?.overallRating &&
        e1?.accuracyRating == e2?.accuracyRating &&
        e1?.communicationRating == e2?.communicationRating &&
        e1?.onTimeRating == e2?.onTimeRating &&
        e1?.userRef == e2?.userRef &&
        e1?.reviewDescription == e2?.reviewDescription &&
        e1?.instrumentRef == e2?.instrumentRef;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.timeStamp,
        e?.labRef,
        e?.overallRating,
        e?.accuracyRating,
        e?.communicationRating,
        e?.onTimeRating,
        e?.userRef,
        e?.reviewDescription,
        e?.instrumentRef
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
