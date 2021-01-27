import 'package:flutter/material.dart';
import 'package:ricarth_flutter/helpers/responsive_values.dart';
import 'package:ricarth_flutter/pages/personal_views/book_item.dart';
import 'package:ricarth_flutter/values/list_books.dart';
import 'package:ricarth_flutter/values/my_colors.dart';

class MyBooksPage extends StatefulWidget {
  @override
  _MyBooksPageState createState() => _MyBooksPageState();
}

class _MyBooksPageState extends State<MyBooksPage> {
  List<Book> listBook = getListBooks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Personal Books",
        ),
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
              Text(
                "Entendo a importância do hábito de ler, tanto para construção de um cidadão " +
                    "contextualizado, quanto para o seu [do cidadão] impacto na melhoria da socie" +
                    "dade. Venho ano após ano construindo e firmando esse hábito na minha vida. \n" +
                    "\n" +
                    "Assim, inspirado no meu professor Vinicius Garcia (que se inspirou em outro " +
                    "professor meu, Fernando Castor) deixo aqui registrado minhas leituras.\n",
                textAlign: TextAlign.justify,
              ),
              Divider(),
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

  List<Widget> _generateWidgets() {
    List<Widget> listWidget = [];
    int actualYear = 2022;

    int i = 0;
    while (i < listBook.length) {
      if (listBook[i].startedLecture.year < actualYear) {
        actualYear = listBook[i].startedLecture.year;
        listWidget.add(
          Container(
            width: 100,
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 50),
            alignment: Alignment.center,
            color: MyColors.carolinaBlue,
            child: Text(
              actualYear.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }
      listWidget.add(BookItem(book: listBook[i]));
      i++;
    }
    return listWidget;
  }
}
