import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ricarth_flutter/models/book_item.dart';

class BookService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<dynamic> addOrEditBook(Book book) async {
    return _firestore.collection("books").doc(book.id).set(book.toMap());
  }

  Future<dynamic> deleteBook(Book book) async {
    return _firestore.collection("books").doc(book.id).delete();
  }
}
