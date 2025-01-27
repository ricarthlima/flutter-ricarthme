import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/convert_date.dart';
import 'package:ricarth_flutter/books/models/book_item.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/books/services/book_service.dart';
import 'package:url_launcher/url_launcher.dart';

class BookItemWidget extends StatelessWidget {
  final Book book;
  final Function onShowUpdateModal;
  final bool isBacklog;
  BookItemWidget({
    required this.book,
    required this.onShowUpdateModal,
    this.isBacklog = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (book.onClick != null) {
          book.onClick!();
        } else {
          String text = book.title.toLowerCase().replaceAll(" ", "+");
          launchUrl(Uri.parse("https://www.amazon.com.br/s?k=$text"));
        }
      },
      onLongPress: () {
        if (AuthService().isAuthenticated()) {
          onShowUpdateModal(context: context, book: book);
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
                  book.urlImage,
                  height: 200,
                  //cacheHeight: 200,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                    visible: isBacklog,
                    child: Container(
                      width: 92,
                      height: 24,
                      decoration: BoxDecoration(color: Colors.red[900]),
                      child: Center(
                        child: Text(
                          "BACKLOG",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
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
                                onShowUpdateModal(context: context, book: book);
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
                                      "Deseja remover ${book.title}?",
                                    ),
                                    action: SnackBarAction(
                                      label: "Remover",
                                      onPressed: () {
                                        BookService().deleteBook(book);
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
                                    book.urlImage,
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
              book.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: (book.isHQ != null && book.isHQ!)
                    ? Colors.yellow[300]
                    : Colors.purple[300],
              ),
              textAlign: TextAlign.center,
            ),
            //Author
            Text(
              book.author,
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
              (book.daysToFinish != null || book.finishedLecture != null)
                  ? book.pages.toString() +
                      " páginas em\n(${convertDate(book.startedLecture)})" +
                      " + ${calculateDays()} dias"
                  : book.pages.toString() +
                      " páginas em\n(${convertDate(book.startedLecture)})",
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

  String calculateDays() {
    if (book.finishedLecture != null) {
      return book.startedLecture
          .difference(book.finishedLecture!)
          .inDays
          .abs()
          .toString();
    } else {
      if (book.daysToFinish != null) {
        return book.daysToFinish.toString();
      }
    }

    return "A";
  }
}
