import 'package:intl/intl.dart';

String numberFormatDecimal(dynamic number) {
  return NumberFormat.decimalPattern('ru_RU').format(number);
}

String extractTime(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedTime = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return formattedTime;
}

String calculateTimeDifference(String departureTime, String arrivalTime) {
  DateTime departureDateTime = DateTime.parse(departureTime);
  DateTime arrivalDateTime = DateTime.parse(arrivalTime);
  Duration difference = arrivalDateTime.difference(departureDateTime);
  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);
  double totalHours = hours + (minutes / 60);
  return totalHours.toStringAsFixed(1);
}