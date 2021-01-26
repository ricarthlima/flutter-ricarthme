import 'package:flutter/material.dart';

class Book {
  String urlImage;
  String title;
  String author;
  int pages;
  DateTime startedLecture;
  int daysToFinish;

  Book(
      {this.urlImage,
      this.title,
      this.author,
      this.pages,
      this.startedLecture,
      this.daysToFinish});
}

class BookItem extends StatelessWidget {
  final Book book;
  BookItem({this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            book.urlImage,
            height: 200,
            cacheHeight: 200,
          ),
          Text(
            book.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          //Author
          Text(
            book.author,
            style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          //Other Information
          Text(
            book.pages.toString() +
                " pages in (" +
                book.startedLecture.day.toString() +
                "/" +
                book.startedLecture.month.toString() +
                "/" +
                book.startedLecture.year.toString() +
                ") + " +
                book.daysToFinish.toString() +
                " days",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
