class Book {
  String? id;
  String urlImage;
  String title;
  String author;
  int pages;
  DateTime startedLecture;
  int daysToFinish;
  Function? onClick;
  bool? isHQ;

  Book({
    this.id,
    required this.urlImage,
    required this.title,
    required this.author,
    required this.pages,
    required this.startedLecture,
    required this.daysToFinish,
    this.isHQ,
  });

  Book.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        urlImage = map["urlImage"],
        title = map["title"],
        author = map["author"],
        pages = map["pages"],
        startedLecture = DateTime.parse(map["startedLecture"]),
        daysToFinish = map["daysToFinish"],
        isHQ = map["isHQ"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "urlImage": urlImage,
      "title": title,
      "author": author,
      "pages": pages,
      "startedLecture": startedLecture.toString(),
      "daysToFinish": daysToFinish,
      "isHQ": isHQ,
    };
  }
}
