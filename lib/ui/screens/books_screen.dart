import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/models/book_item.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/services/book_service.dart';
import 'package:ricarth_flutter/ui/widgets/book_widget.dart';
import 'package:ricarth_flutter/values/list_books.dart';
import 'package:flutter/services.dart';

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
            showUpinsertDialog();
          }
        }
      });
    } else {
      showUpinsertDialog();
    }
  }

  showUpinsertDialog({Book? book}) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _authorController = TextEditingController();
    TextEditingController _pagesController = TextEditingController();
    TextEditingController _startedLectureController = TextEditingController();
    TextEditingController _daysToFinishController = TextEditingController();
    TextEditingController _urlImageController = TextEditingController();
    bool isHQ = (book != null && book.isHQ != null) ? book.isHQ! : false;

    if (book != null) {
      _titleController.text = book.title;
      _authorController.text = book.author;
      _pagesController.text = book.pages.toString();
      _startedLectureController.text = book.startedLecture.toString();
      _daysToFinishController.text = book.daysToFinish.toString();
      _urlImageController.text = book.urlImage;
    } else {
      _startedLectureController.text = DateTime.now().toString();
    }

    bool isLoading = false;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              child: Container(
                width: 300,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Form(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.book,
                              color: Colors.purple,
                            ),
                            SizedBox(width: 8),
                            Text(
                              (book != null)
                                  ? "Editar Livro"
                                  : "Adicionar Livro",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: InputDecoration(
                            labelText: "Título",
                          ),
                        ),
                        TextFormField(
                          controller: _authorController,
                          maxLength: 50,
                          decoration: InputDecoration(labelText: "Autor"),
                        ),
                        TextFormField(
                          controller: _pagesController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(labelText: "Contagem de páginas"),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 200,
                              child: TextFormField(
                                controller: _startedLectureController,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: "Comecei em",
                                ),
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.date_range,
                                color: Colors.purple,
                                size: 32,
                              ),
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.parse(
                                      _startedLectureController.text),
                                  firstDate: DateTime.now().subtract(
                                    Duration(days: 3650),
                                  ),
                                  lastDate: DateTime.now(),
                                ).then((DateTime? date) {
                                  if (date != null) {
                                    _startedLectureController.text =
                                        date.toString();
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                        TextFormField(
                          controller: _daysToFinishController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(labelText: "Dias para leitura"),
                        ),
                        TextFormField(
                          controller: _urlImageController,
                          decoration:
                              InputDecoration(labelText: "Url da Imagem"),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              activeColor: Colors.purple,
                              value: isHQ,
                              onChanged: (value) {
                                setState(() {
                                  isHQ = !isHQ;
                                });
                              },
                            ),
                            SizedBox(width: 8),
                            Text("É uma HQ?"),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Divider(),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.purple),
                          ),
                          onPressed: () {
                            if (!isLoading) {
                              setState(() {
                                isLoading = true;
                              });

                              String id = _titleController.text;
                              if (book != null && book.id != null) {
                                id = book.id!;
                              }

                              BookService()
                                  .addOrEditBook(
                                Book(
                                  id: id,
                                  isHQ: isHQ,
                                  urlImage: _urlImageController.text,
                                  title: _titleController.text,
                                  author: _authorController.text,
                                  pages: int.parse(_pagesController.text),
                                  startedLecture: DateTime.parse(
                                      _startedLectureController.text),
                                  daysToFinish:
                                      _daysToFinishController.text != ""
                                          ? int.parse(
                                              _daysToFinishController.text,
                                            )
                                          : 0,
                                ),
                              )
                                  .then(
                                (value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.pop(context);
                                },
                              );
                            }
                          },
                          child: (isLoading)
                              ? SizedBox(
                                  height: 16,
                                  width: 16,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text("Enviar"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
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
      if (listBook[i].startedLecture.year < actualYear) {
        actualYear = listBook[i].startedLecture.year;
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

      bool addItem = false;
      bool isBacklog = false;

      if (listBook[i].isHQ != null && listBook[i].isHQ!) {
        if (isShowingHQs) {
          addItem = true;
          countHQ++;
        }
      } else {
        addItem = true;
      }

      if (listBook[i].daysToFinish == 0) {
        isBacklog = true;
        if (FirebaseAuth.instance.currentUser == null) {
          addItem = false;
        }
      }

      if (addItem) {
        listWidget.add(
          BookItemWidget(
            book: listBook[i],
            onLongPress: showUpinsertDialog,
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
