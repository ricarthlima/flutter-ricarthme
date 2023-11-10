import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/pages/personal_views/book_item.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/values/list_books.dart';

class MyBooksPage extends StatefulWidget {
  @override
  _MyBooksPageState createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  List<Book> listBook = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthService authService = AuthService();

  @override
  void initState() {
    firestore.collection("books").snapshots().listen((snapshot) {
      List<Book> temp = [];

      snapshot.docs.forEach((doc) {
        Book book = Book.fromMap(doc.data());
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
        title: Text(
          "Leituras",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.purple[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fabClicked();
        },
        backgroundColor: Colors.purple,
        child: Icon(Icons.add),
      ),
      body: Container(
        padding: (getWidth(context) < 700)
            ? EdgeInsets.all(15)
            : EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 20,
              ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                "Entendo a importância do hábito de ler, tanto para construção de um cidadão " +
                    "contextualizado, quanto para o seu [do cidadão] impacto na melhoria da socie" +
                    "dade. Venho ano após ano construindo e firmando esse hábito na minha vida. \n" +
                    "\n" +
                    "Assim, inspirado no meu professor Vinicius Garcia (que se inspirou em outro " +
                    "professor meu, Fernando Castor) deixo aqui registrado minhas leituras.\n",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              Center(
                child: Wrap(
                  runSpacing: 20,
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
            showAddDialog();
          }
        }
      });
    } else {
      showAddDialog();
    }
  }

  showAddDialog() {
    print("ADD");
  }

  List<Widget> _generateWidgets() {
    List<Widget> listWidget = [];
    int actualYear = DateTime.now().year;

    int i = 0;
    int count = 0;
    while (i < listBook.length) {
      if (listBook[i].startedLecture.year < actualYear) {
        actualYear = listBook[i].startedLecture.year;
        listWidget.add(
          Container(
            width: 100,
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 50),
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
                  "(" + count.toString() + ")",
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
        listWidget.removeLast();
      }
      listWidget.add(BookItem(book: listBook[i]));
      count++;
      i++;
    }
    return listWidget;
  }
}
