class CalendarHelper {
  CalendarHelper._();

  static String checkMonth(int month) {
    List<String> months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    return months[month];
  }

  static String checkDate(DateTime dateTime) {
    final int today = DateTime.now().day;
    final String month = checkMonth(dateTime.month);
    if (today == dateTime.day) {
      return "Today";
    } else {
      return "${dateTime.day}, $month";
    }
  }
}
