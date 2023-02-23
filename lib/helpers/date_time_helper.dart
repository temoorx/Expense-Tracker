// convert DateTime object to String yyymmdd

String convertDateTimeToString(DateTime dateTime) {
  // year in the format yyyy
  String year = dateTime.year.toString();
  // month in the format mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }
//day in the fromat dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }
//return the final in the format yyymmdd
  String yyymmdd = year + month + day;

  return yyymmdd;
}
