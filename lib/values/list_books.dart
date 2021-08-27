import 'package:ricarth_flutter/pages/personal_views/book_item.dart';

List<Book> getListBooks() {
  List<Book> listBook = [
    Book(
      title: "Harry Potter e a Pedra Filosofal",
      author: "J.K. Rowling",
      pages: 208,
      startedLecture: DateTime.parse("2021-02-26"),
      daysToFinish: 21,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/416vIJ9jCOL._SX346_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "Você É Inteligente O Bastante Para Trabalhar No Google?",
      author: "William Poundstone",
      pages: 292,
      startedLecture: DateTime.parse("2017-04-14"),
      daysToFinish: 27,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/71iMfThgGvL.jpg",
    ),
    Book(
      title: "O Monge e o Executivo",
      author: "James C. Hunter",
      pages: 144,
      startedLecture: DateTime.parse("2017-01-04"),
      daysToFinish: 5,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/51lQ-GKwxrL._SX342_SY445_QL70_ML2_.jpg",
    ),
    Book(
      title: "10 faces da inovação",
      author: "Allan Pease and Barbara Pease",
      pages: 280,
      startedLecture: DateTime.parse("2017-01-11"),
      daysToFinish: 38,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/41VxbsAta0L._SX346_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "Como conquistar as pessoas",
      author: "Allan Pease and Barbara Pease",
      pages: 63,
      startedLecture: DateTime.parse("2017-06-12"),
      daysToFinish: 10,
      urlImage: "https://m.media-amazon.com/images/I/51rDSKTmszL.jpg",
    ),
    Book(
      title: "O Poder do Hábito",
      author: "Charles Duhigg",
      pages: 408,
      startedLecture: DateTime.parse("2017-06-12"),
      daysToFinish: 42,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/81QPybA6jNL.jpg",
    ),
    Book(
      title: "Pense como um artista",
      author: "Will Gompertz",
      pages: 224,
      startedLecture: DateTime.parse("2017-12-22"),
      daysToFinish: 18,
      urlImage: "https://m.media-amazon.com/images/I/51MpVpmdvrL.jpg",
    ),
    Book(
      title: "2001 Uma odisséia no espaço",
      author: "Arthur C. Clark",
      pages: 336,
      startedLecture: DateTime.parse("2018-03-22"),
      daysToFinish: 29,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/61zLkd00iuL.jpg",
    ),
    Book(
      title: "Cave Mais Fundo",
      author: "Joshua Harris",
      pages: 310,
      startedLecture: DateTime.parse("2018-03-22"),
      daysToFinish: 29,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/61eHCd1+xAL.jpg",
    ),
    Book(
      title: "De volta ao Mosteiro",
      author: "James C. Hunter",
      pages: 192,
      startedLecture: DateTime.parse("2018-03-22"),
      daysToFinish: 4,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/81fNwdXUO-L.jpg",
    ),
    Book(
      title: "As Cinco Linguagens do Amor",
      author: "Gary Chapman",
      pages: 216,
      startedLecture: DateTime.parse("2018-05-13"),
      daysToFinish: 25,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/51zgCvg13TL._SX342_SY445_QL70_ML2_.jpg",
    ),
    Book(
      title: "A Jornada do Escritor",
      author: "Christopher Vogler",
      pages: 484,
      startedLecture: DateTime.parse("2018-08-03"),
      daysToFinish: 72,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/814LrU4S9ZL.jpg",
    ),
    Book(
      title: "O Mistério do 5 Estrelas",
      author: "Marcos Rey",
      pages: 125,
      startedLecture: DateTime.parse("2020-05-30"),
      daysToFinish: 10,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/81Uia-8X4qL.jpg",
    ),
    Book(
      title: "O Homem Mais Rico da Babilônia",
      author: "George S. Clason",
      pages: 157,
      startedLecture: DateTime.parse("2019-02-25"),
      daysToFinish: 23,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/51XiB9dNvTL._SX359_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "[Pocket Edition] Os 7 hábitos das pessoas altamente eficazes",
      author: "Stephen R. Covey",
      pages: 77,
      startedLecture: DateTime.parse("2019-03-26"),
      daysToFinish: 1,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/51RQgyeVbGL._SX352_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "O Milagre da Manhã",
      author: "Hal Erold",
      pages: 194,
      startedLecture: DateTime.parse("2019-02-18"),
      daysToFinish: 8,
      urlImage:
          "https://lojasaraiva.vteximg.com.br/arquivos/ids/12107927/1008997059.jpg",
    ),
    Book(
      title: "Como pensar mais sobre sexo",
      author: "Alain de Botton",
      pages: 150,
      startedLecture: DateTime.parse("2019-04-04"),
      daysToFinish: 37,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/41r12XJB3cL._SX363_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "A Startup Enxuta",
      author: "Eric Ries",
      pages: 274,
      startedLecture: DateTime.parse("2018-10-02"),
      daysToFinish: 196,
      urlImage: "https://m.media-amazon.com/images/I/51N-u8AsmdL.jpg",
    ),
    Book(
      title: "Gestão do Amanhã",
      author: "Sando Magaldi and José Salibi Neto",
      pages: 247,
      startedLecture: DateTime.parse("2019-03-26"),
      daysToFinish: 58,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/41sFNgnCzaL._SX332_BO1,204,203,200_.jpg",
    ),
    Book(
      title: "Os segredos da mente milionária",
      author: "T. Harv Eker",
      pages: 175,
      startedLecture: DateTime.parse("2019-05-23"),
      daysToFinish: 76,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/81ZnJcgjCdL.jpg",
    ),
    Book(
      title: "A Sutil Arte de Ligar o Foda-se",
      author: "Mark Manson",
      pages: 223,
      startedLecture: DateTime.parse("2019-08-08"),
      daysToFinish: 32,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/611wpWdKBCL.jpg",
    ),
    Book(
      title: "Quem mexeu no meu queijo?",
      author: "Spencer Johnson",
      pages: 110,
      startedLecture: DateTime.parse("2019-09-09"),
      daysToFinish: 4,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/71fD1WDLhML.jpg",
    ),
    Book(
      title: "Dúvida Cruel",
      author: "Manual do Mundo",
      pages: 183,
      startedLecture: DateTime.parse("2019-11-13"),
      daysToFinish: 27,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/91tFZORWDsL.jpg",
    ),
    Book(
      title: "Algoritmos para Viver",
      author: " Brian Christian and Tom Griffiths",
      pages: 529,
      startedLecture: DateTime.parse("2018-08-03"),
      daysToFinish: 115,
      urlImage:
          "https://images-na.ssl-images-amazon.com/images/I/51DP8x8cULL._SX342_SY445_QL70_ML2_.jpg",
    ),
  ];

  listBook.sort((a, b) {
    if (a.startedLecture.year < b.startedLecture.year) {
      return 1;
    } else if (a.startedLecture.year > b.startedLecture.year) {
      return -1;
    } else {
      if (a.startedLecture.month < b.startedLecture.month) {
        return 1;
      } else if (a.startedLecture.month > b.startedLecture.month) {
        return -1;
      } else {
        if (a.startedLecture.day < a.startedLecture.month) {
          return 1;
        } else if (a.startedLecture.day > a.startedLecture.day) {
          return -1;
        } else {
          return a.title.compareTo(b.title);
        }
      }
    }
  });

  return listBook;
}
