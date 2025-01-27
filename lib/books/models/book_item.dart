// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Book {
  String? id;
  String urlImage;
  String title;
  String author;
  int pages;
  DateTime startedLecture;
  DateTime? finishedLecture;
  int? daysToFinish;
  bool? isHQ;

  Function? onClick;

  Book({
    this.id,
    required this.urlImage,
    required this.title,
    required this.author,
    required this.pages,
    required this.startedLecture,
    this.finishedLecture,
    this.daysToFinish,
    this.onClick,
    this.isHQ,
  });

  // Book({
  //   this.id,
  //   required this.urlImage,
  //   required this.title,
  //   required this.author,
  //   required this.pages,
  //   required this.startedLecture,
  //   required this.daysToFinish,
  //   this.isHQ,
  // });

  // Book.fromMap(Map<String, dynamic> map)
  //     : id = map["id"],
  //       urlImage = map["urlImage"],
  //       title = map["title"],
  //       author = map["author"],
  //       pages = map["pages"],
  //       startedLecture = DateTime.parse(map["startedLecture"]),
  //       daysToFinish = map["daysToFinish"],
  //       isHQ = map["isHQ"];

  // Map<String, dynamic> toMap() {
  //   return {
  //     "id": id,
  //     "urlImage": urlImage,
  //     "title": title,
  //     "author": author,
  //     "pages": pages,
  //     "startedLecture": startedLecture.toString(),
  //     "daysToFinish": daysToFinish,
  //     "isHQ": isHQ,
  //   };
  // }

  Book copyWith({
    String? id,
    String? urlImage,
    String? title,
    String? author,
    int? pages,
    DateTime? startedLecture,
    DateTime? finishedLecture,
    int? daysToFinish,
    bool? isHQ,
  }) {
    return Book(
      id: id ?? this.id,
      urlImage: urlImage ?? this.urlImage,
      title: title ?? this.title,
      author: author ?? this.author,
      pages: pages ?? this.pages,
      startedLecture: startedLecture ?? this.startedLecture,
      finishedLecture: finishedLecture ?? this.finishedLecture,
      daysToFinish: daysToFinish ?? this.daysToFinish,
      isHQ: isHQ ?? this.isHQ,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'urlImage': urlImage,
      'title': title,
      'author': author,
      'pages': pages,
      'startedLecture': startedLecture.toString(),
      'finishedLecture': finishedLecture?.toString(),
      'daysToFinish': daysToFinish,
      'isHQ': isHQ,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] != null ? map['id'] as String : null,
      urlImage: map['urlImage'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      pages: map['pages'] as int,
      startedLecture: DateTime.parse(map["startedLecture"]),
      finishedLecture: map['finishedLecture'] != null
          ? DateTime.parse(map["finishedLecture"])
          : null,
      daysToFinish:
          map['daysToFinish'] != null ? map['daysToFinish'] as int : null,
      isHQ: map['isHQ'] != null ? map['isHQ'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) =>
      Book.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Book(id: $id, urlImage: $urlImage, title: $title, author: $author, pages: $pages, startedLecture: $startedLecture, finishedLecture: $finishedLecture, daysToFinish: $daysToFinish, onClick: $onClick, isHQ: $isHQ)';
  }

  @override
  bool operator ==(covariant Book other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.urlImage == urlImage &&
        other.title == title &&
        other.author == author &&
        other.pages == pages &&
        other.startedLecture == startedLecture &&
        other.finishedLecture == finishedLecture &&
        other.daysToFinish == daysToFinish &&
        other.onClick == onClick &&
        other.isHQ == isHQ;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        urlImage.hashCode ^
        title.hashCode ^
        author.hashCode ^
        pages.hashCode ^
        startedLecture.hashCode ^
        finishedLecture.hashCode ^
        daysToFinish.hashCode ^
        onClick.hashCode ^
        isHQ.hashCode;
  }
}
