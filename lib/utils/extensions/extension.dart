extension Format on DateTime {
  String dateTimeFormat() {
    return "$year-${month.toString().padLeft(2, "0")}-$day $hour:${minute.toString().padLeft(2, "0")}";
  }
}
