import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogsRecord extends FirestoreRecord {
  BlogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "blog_title" field.
  String? _blogTitle;
  String get blogTitle => _blogTitle ?? '';
  bool hasBlogTitle() => _blogTitle != null;

  // "blog_author" field.
  String? _blogAuthor;
  String get blogAuthor => _blogAuthor ?? '';
  bool hasBlogAuthor() => _blogAuthor != null;

  // "published_date" field.
  DateTime? _publishedDate;
  DateTime? get publishedDate => _publishedDate;
  bool hasPublishedDate() => _publishedDate != null;

  // "blog_subtitle" field.
  String? _blogSubtitle;
  String get blogSubtitle => _blogSubtitle ?? '';
  bool hasBlogSubtitle() => _blogSubtitle != null;

  // "blog_content" field.
  List<BlogContentStruct>? _blogContent;
  List<BlogContentStruct> get blogContent => _blogContent ?? const [];
  bool hasBlogContent() => _blogContent != null;

  // "blog_header_image" field.
  String? _blogHeaderImage;
  String get blogHeaderImage => _blogHeaderImage ?? '';
  bool hasBlogHeaderImage() => _blogHeaderImage != null;

  void _initializeFields() {
    _blogTitle = snapshotData['blog_title'] as String?;
    _blogAuthor = snapshotData['blog_author'] as String?;
    _publishedDate = snapshotData['published_date'] as DateTime?;
    _blogSubtitle = snapshotData['blog_subtitle'] as String?;
    _blogContent = getStructList(
      snapshotData['blog_content'],
      BlogContentStruct.fromMap,
    );
    _blogHeaderImage = snapshotData['blog_header_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogs');

  static Stream<BlogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogsRecord.fromSnapshot(s));

  static Future<BlogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogsRecord.fromSnapshot(s));

  static BlogsRecord fromSnapshot(DocumentSnapshot snapshot) => BlogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogsRecordData({
  String? blogTitle,
  String? blogAuthor,
  DateTime? publishedDate,
  String? blogSubtitle,
  String? blogHeaderImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'blog_title': blogTitle,
      'blog_author': blogAuthor,
      'published_date': publishedDate,
      'blog_subtitle': blogSubtitle,
      'blog_header_image': blogHeaderImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogsRecordDocumentEquality implements Equality<BlogsRecord> {
  const BlogsRecordDocumentEquality();

  @override
  bool equals(BlogsRecord? e1, BlogsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.blogTitle == e2?.blogTitle &&
        e1?.blogAuthor == e2?.blogAuthor &&
        e1?.publishedDate == e2?.publishedDate &&
        e1?.blogSubtitle == e2?.blogSubtitle &&
        listEquality.equals(e1?.blogContent, e2?.blogContent) &&
        e1?.blogHeaderImage == e2?.blogHeaderImage;
  }

  @override
  int hash(BlogsRecord? e) => const ListEquality().hash([
        e?.blogTitle,
        e?.blogAuthor,
        e?.publishedDate,
        e?.blogSubtitle,
        e?.blogContent,
        e?.blogHeaderImage
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogsRecord;
}
