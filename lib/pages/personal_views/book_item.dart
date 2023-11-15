import 'package:flutter/material.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/services/book_service.dart';
import 'package:url_launcher/url_launcher.dart';

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

class BookItem extends StatelessWidget {
  final Book? book;
  final Function onLongPress;
  BookItem({this.book, required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (book!.onClick != null) {
          book!.onClick!();
        } else {
          String text = book!.title.toLowerCase().replaceAll(" ", "+");
          launchUrl(Uri.parse("https://www.amazon.com.br/s?k=$text"));
        }
      },
      onLongPress: () {
        if (AuthService().isAuthenticated()) {
          onLongPress(book: book!);
        }
      },
      child: Container(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  book!.urlImage,
                  height: 200,
                  //cacheHeight: 200,
                ),
                (AuthService().isAuthenticated())
                    ? Positioned(
                        top: 24,
                        right: 0,
                        child: InkWell(
                          onLongPress: () {
                            BookService().deleteBook(book!);
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(150),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Icon(
                              Icons.delete,
                              size: 14,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(150),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: InkWell(
                      onTap: () {
                        showDialog(
                          barrierColor: Colors.black.withAlpha(200),
                          context: context,
                          builder: (context) {
                            return Dialog(
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              child: TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0.3, end: 1),
                                duration: Duration(milliseconds: 300),
                                builder: (context, value, child) {
                                  return Image.network(
                                    book!.urlImage,
                                    height: MediaQuery.of(context).size.height *
                                        0.75 *
                                        value,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              book!.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: (book!.isHQ != null && book!.isHQ!)
                    ? Colors.yellow[300]
                    : Colors.purple[300],
              ),
              textAlign: TextAlign.center,
            ),
            //Author
            Text(
              book!.author,
              style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.grey[400],
              ),
              textAlign: TextAlign.center,
            ),
            //Other Information
            Text(
              book!.pages.toString() +
                  " pages in (" +
                  book!.startedLecture.day.toString() +
                  "/" +
                  book!.startedLecture.month.toString() +
                  "/" +
                  book!.startedLecture.year.toString() +
                  ") + " +
                  book!.daysToFinish.toString() +
                  " days",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
