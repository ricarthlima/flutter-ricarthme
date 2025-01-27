import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "../models/book_item.dart";
import "../services/book_service.dart";

showUpinsertBookDialog({required BuildContext context, Book? book}) {
  showDialog(
    context: context,
    builder: (context) {
      return _UpinsertBookDialog(book: book);
    },
  );
}

class _UpinsertBookDialog extends StatefulWidget {
  final Book? book;
  const _UpinsertBookDialog({Key? key, this.book}) : super(key: key);

  @override
  State<_UpinsertBookDialog> createState() => __UpinsertBookDialogState();
}

class __UpinsertBookDialogState extends State<_UpinsertBookDialog> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _pagesController = TextEditingController();
  TextEditingController _startedLectureController = TextEditingController();
  TextEditingController _finishedLectureController = TextEditingController();
  TextEditingController _daysToFinishController = TextEditingController();
  TextEditingController _urlImageController = TextEditingController();
  bool isHQ = false;
  bool isLoading = false;
  bool isShowingDays = false;
  bool isFinishedSwitch = false;
  DateTime? _finishedLecture;

  @override
  void initState() {
    isHQ = (widget.book != null && widget.book!.isHQ != null)
        ? widget.book!.isHQ!
        : false;
    if (widget.book != null) {
      if (widget.book!.daysToFinish != null ||
          widget.book!.finishedLecture != null) {
        isFinishedSwitch = true;
      }

      if (widget.book!.daysToFinish != null &&
          widget.book!.finishedLecture == null) {
        isShowingDays = true;
      }

      _finishedLecture = widget.book!.finishedLecture;

      _titleController.text = widget.book!.title;
      _authorController.text = widget.book!.author;
      _pagesController.text = widget.book!.pages.toString();
      _startedLectureController.text =
          widget.book!.startedLecture.toString().substring(0, 10);

      _finishedLectureController.text =
          (widget.book!.finishedLecture ?? DateTime.now())
              .toString()
              .substring(0, 10);
      _daysToFinishController.text =
          (widget.book!.daysToFinish ?? 0).toString();

      _urlImageController.text = widget.book!.urlImage;
    } else {
      _startedLectureController.text =
          DateTime.now().toString().substring(0, 10);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.book,
                      color: Colors.purple,
                    ),
                    SizedBox(width: 8),
                    Text(
                      (widget.book != null)
                          ? "Editar Livro"
                          : "Adicionar Livro",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 16,
                    children: [
                      Text("Informações"),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
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
                  maxLength: 5,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(labelText: "Contagem de páginas"),
                ),
                TextFormField(
                  controller: _urlImageController,
                  maxLength: 2000,
                  decoration: InputDecoration(labelText: "Url da Imagem"),
                ),
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
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    spacing: 16,
                    children: [
                      Text("Tempo de leitura"),
                      Expanded(child: Divider()),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 16,
                  children: [
                    Expanded(
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
                          initialDate:
                              DateTime.parse(_startedLectureController.text),
                          firstDate: DateTime.now().subtract(
                            Duration(days: 3650),
                          ),
                          lastDate: DateTime.now(),
                        ).then((DateTime? date) {
                          if (date != null) {
                            _startedLectureController.text =
                                date.toString().substring(0, 10);
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SwitchListTile(
                  value: isFinishedSwitch,
                  title: Text("Terminei a leitura"),
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      isFinishedSwitch = !isFinishedSwitch;
                    });
                  },
                ),
                Visibility(
                  visible: isFinishedSwitch,
                  child: Column(
                    children: [
                      SwitchListTile(
                        value: isShowingDays,
                        title: Text("Usar contagem de dias"),
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.zero,
                        onChanged: (value) {
                          setState(() {
                            isShowingDays = !isShowingDays;
                          });
                        },
                      ),
                      Visibility(
                        visible: !isShowingDays,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 16,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _finishedLectureController,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: "Terminei em",
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
                                  initialDate: (_finishedLecture != null)
                                      ? _finishedLecture
                                      : DateTime.now(),
                                  firstDate: DateTime.now().subtract(
                                    Duration(days: 3650),
                                  ),
                                  lastDate: DateTime.now(),
                                ).then((DateTime? date) {
                                  _finishedLecture = date;
                                  if (date != null) {
                                    _finishedLectureController.text =
                                        date.toString().substring(0, 10);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isShowingDays,
                        child: TextFormField(
                          controller: _daysToFinishController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration:
                              InputDecoration(labelText: "Dias para leitura"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.purple),
                  ),
                  onPressed: () {
                    if (!isLoading) {
                      setState(() {
                        isLoading = true;
                      });

                      String id = _titleController.text;
                      if (widget.book != null && widget.book!.id != null) {
                        id = widget.book!.id!;
                      }

                      Book newBook = Book(
                        id: id,
                        isHQ: isHQ,
                        urlImage: _urlImageController.text,
                        title: _titleController.text,
                        author: _authorController.text,
                        pages: int.parse(_pagesController.text),
                        startedLecture:
                            DateTime.parse(_startedLectureController.text),
                        daysToFinish: null,
                        finishedLecture: null,
                      );

                      if (isFinishedSwitch) {
                        if (_finishedLecture != null) {
                          newBook.finishedLecture = _finishedLecture!;
                        } else {
                          if (_daysToFinishController.text != "") {
                            newBook.daysToFinish =
                                int.parse(_daysToFinishController.text);
                          }
                        }
                      }

                      BookService().addOrEditBook(newBook).then(
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
  }
}
