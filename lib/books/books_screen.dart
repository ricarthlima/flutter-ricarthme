import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/books/models/book_item.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/books/widgets/book_widget.dart';
import 'package:ricarth_flutter/values/list_books.dart';
import 'components/upinsert_book_modal.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  List<Book> listBook = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();

  bool isShowingHQs = false;

  @override
  void initState() {
    firestore.collection("books").snapshots().listen((snapshot) {
      List<Book> temp = [];

      snapshot.docs.forEach((doc) {
        Book book = Book.fromMap(doc.data());
        book.id = doc.id;
        temp.add(book);
      });

      temp = orderListBooks(temp);

      setState(() {
        listBook = temp;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text("Leituras"),
        centerTitle: true,
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(
            onPressed: () {
              if (!authService.isAuthenticated()) {
                authService.showAuthDialog(context).then((value) {
                  setState(() {});
                });
              } else {
                authService.logout().then((value) {
                  setState(() {});
                });
              }
            },
            icon: (!authService.isAuthenticated())
                ? Icon(Icons.person)
                : Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: (authService.isAuthenticated())
          ? FloatingActionButton(
              onPressed: () {
                fabClicked();
              },
              backgroundColor: Colors.purple,
              child: Icon(Icons.add),
            )
          : null,
      body: Container(
        padding: (getWidth(context) < 700)
            ? EdgeInsets.all(15)
            : EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: min(700, MediaQuery.of(context).size.width),
                child: SelectableText(
                  "Entendo a importância do hábito da leitura, tanto pela busca "
                  "de um autoconhecimento,  quanto para construção de um cidadão "
                  "crítico e contextualizado. "
                  "Venho ano após ano, admito que, com dificuldades, construindo e firmando esse hábito na minha vida. "
                  "Assim, inspirado no meu professor Vinicius Garcia (que se inspirou em outro "
                  "professor meu, Fernando Castor) deixo aqui registrado minhas leituras. "
                  "Ah! Gosto de registrar minhas HQs, mas elas contam separadamente para o total.\n"
                  "Minha meta sempre será, pelo menos, 12 livros em um ano.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: isShowingHQs,
                    activeColor: Colors.purple,
                    onChanged: (value) {
                      setState(() {
                        isShowingHQs = !isShowingHQs;
                      });
                    },
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Mostrar HQs",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: Wrap(
                  runSpacing: 50,
                  children: _generateWidgets(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fabClicked() {
    if (!authService.isAuthenticated()) {
      authService.showAuthDialog(context).then((value) {
        if (value != null) {
          if ((value as bool) == true) {
            showUpinsertBookDialog(context: context);
          }
        }
      });
    } else {
      showUpinsertBookDialog(context: context);
    }
  }

  List<Widget> _generateWidgets() {
    List<Widget> listWidget = [];
    int actualYear = DateTime.now().year;

    int i = 0;
    int count = 0;
    int countHQ = 0;

    listBook.add(
      Book(
        urlImage: "",
        title: "title",
        author: "author",
        pages: 0,
        startedLecture: DateTime.parse("2016-03-03"),
        daysToFinish: 2,
      ),
    );

    listBook.sort(
      (a, b) => b.startedLecture.year.compareTo(a.startedLecture.year),
    );

    while (i < listBook.length) {
      bool addItem = false;
      bool isBacklog = false;

      if (listBook[i].daysToFinish == null &&
          listBook[i].finishedLecture == null) {
        isBacklog = true;
        if (FirebaseAuth.instance.currentUser == null) {
          addItem = false;
        }
      }

      if (listBook[i].finishedLecture != null) {
        listBook[i].daysToFinish = listBook[i]
            .startedLecture
            .difference(listBook[i].finishedLecture!)
            .inDays
            .abs();
      }

      if ((listBook[i].startedLecture)
              .add(Duration(days: listBook[i].daysToFinish ?? 0))
              .year <
          actualYear) {
        actualYear = (listBook[i].startedLecture)
            .add(Duration(days: listBook[i].daysToFinish ?? 0))
            .year;
        listWidget.add(
          Container(
            width: 100,
            height: 200,
            margin: EdgeInsets.symmetric(horizontal: 50), //(200 - width)/2
            alignment: Alignment.center,
            color: Colors.purple[700],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  (actualYear + 1).toString(),
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  (countHQ > 0)
                      ? "(" + (count - countHQ).toString() + " + $countHQ)"
                      : "($count)",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

        listWidget.insert(listWidget.length - (count + 1), listWidget.last);
        count = 0;
        countHQ = 0;
        listWidget.removeLast();
      }

      if (listBook[i].isHQ != null && listBook[i].isHQ!) {
        if (isShowingHQs) {
          addItem = true;
          countHQ++;
        }
      } else {
        addItem = true;
      }

      if (addItem) {
        listWidget.add(
          BookItemWidget(
            book: listBook[i],
            onShowUpdateModal: showUpinsertBookDialog,
            isBacklog: isBacklog,
          ),
        );
        count++;
      }
      i++;
    }

    listWidget.removeLast();
    listWidget.add(
      Container(
        width: 150,
        height: 200,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.purple.withAlpha(50)),
        child: Center(
          child: Text(
            "E aqui terminam o registros, pois a ideia só me veio em 2017. Obrigado por acompanhar!",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    return listWidget;
  }
}
