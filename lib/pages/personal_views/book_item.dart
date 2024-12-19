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

class BookItemWidget extends StatelessWidget {
  final Book? book;
  final Function onLongPress;
  BookItemWidget({this.book, required this.onLongPress});

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
                        bottom: 4,
                        right: 4,
                        child: Column(
                          spacing: 2,
                          children: [
                            InkWell(
                              onTap: () {
                                onLongPress(book: book!);
                              },
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(150),
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Icon(
                                  Icons.edit,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "Deseja remover ${book!.title}?",
                                    ),
                                    action: SnackBarAction(
                                      label: "Remover",
                                      onPressed: () {
                                        BookService().deleteBook(book!);
                                      },
                                    ),
                                  ),
                                );
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
                          ],
                        ),
                      )
                    : Container(),
                Positioned(
                  top: 4,
                  right: 4,
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
              overflow: TextOverflow.ellipsis,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            //Other Information
            Text(
              book!.pages.toString() +
                  " páginas em\n(${convertDate(book!.startedLecture)}) + " +
                  book!.daysToFinish.toString() +
                  " dias",
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

String convertDate(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();

  if (dia.length == 1) dia = "0$dia";
  if (mes.length == 1) mes = "0$mes";

  return dia + "/" + mes + "/" + date.year.toString();
}
