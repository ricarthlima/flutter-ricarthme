import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ricarth_flutter/books/books_screen.dart';
import 'package:ricarth_flutter/ui/professional_page.dart';
import 'package:ricarth_flutter/values/list_books.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

import 'firebase_options.dart';
import 'books/models/book_item.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

  //fillFirestore();
}

fillFirestore() {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Book> listBook = getListBooks();
  listBook.forEach((book) {
    firestore.collection("books").doc(book.title).set(book.toMap());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ricarth.me',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: "/",
      routes: {
        "/": (context) => AnimatedSplashScreen(
              nextScreen: ProfessionalPage(),
              splash: Image.asset(
                "assets/ricarth.png",
                width: 100,
              ),
              backgroundColor: MyColors.royalBlueDark,
            ),
        "/books": (context) => BooksScreen()
      },
      // home: AnimatedSplashScreen(
      //   nextScreen: ProfessionalPage(),
      //   splash: Image.asset(
      //     "assets/ricarth.png",
      //     width: 100,
      //   ),
      //   backgroundColor: MyColors.royalBlueDark,
      // ),
    );
  }
}
