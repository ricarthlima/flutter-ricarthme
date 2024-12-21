String convertDate(DateTime date) {
  String dia = date.day.toString();
  String mes = date.month.toString();

  if (dia.length == 1) dia = "0$dia";
  if (mes.length == 1) mes = "0$mes";

  return dia + "/" + mes + "/" + date.year.toString();
}
