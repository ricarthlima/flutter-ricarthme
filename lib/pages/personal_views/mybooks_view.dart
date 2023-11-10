import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/pages/personal_views/book_item.dart';
import 'package:ricarth_flutter/services/auth_service.dart';
import 'package:ricarth_flutter/values/list_books.dart';
import 'package:flutter/services.dart';

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
                "Entendo a importância do hábito de ler, tanto para construção de um cidadão "
                "contextualizado, quanto para o seu [do cidadão] impacto na melhoria da socie"
                "dade. Venho ano após ano construindo e firmando esse hábito na minha vida. \n"
                "\n"
                "Assim, inspirado no meu professor Vinicius Garcia (que se inspirou em outro "
                "professor meu, Fernando Castor) deixo aqui registrado minhas leituras.\n"
                "\n"
                "Ah! Gosto de registrar minhas HQs, mas elas não contam para os totais de livros.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              //Divider(),
              Padding(
                padding: EdgeInsets.only(bottom: 32),
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

  showAddDialog({Book? book}) {
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
                                MaterialStateProperty.all(Colors.purple),
                          ),
                          onPressed: () {},
                          child: Text("Enviar"),
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
      listWidget.add(BookItem(
        book: listBook[i],
        onLongPress: showAddDialog,
      ));
      if (listBook[i].isHQ != null && listBook[i].isHQ!) {
        countHQ++;
      }
      count++;
      i++;
    }
    return listWidget;
  }
}
