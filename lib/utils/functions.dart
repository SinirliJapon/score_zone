import 'package:intl/intl.dart';

abstract class Functions {
  static int calculateAge(String? dateOfBirth) {
    int playerAge = 0;

    if (dateOfBirth != null && dateOfBirth.toLowerCase() != 'unknown') {
      try {
        DateTime birthDate = DateTime.parse(dateOfBirth);
        DateTime today = DateTime.now();
        int age = today.year - birthDate.year;
        if (today.month < birthDate.month || (today.month == birthDate.month && today.day < birthDate.day)) {
          age--;
        }
        playerAge = age;
      } catch (e) {
        playerAge = 0;
      }
    } else {
      playerAge = 0;
    }

    return playerAge;
  }

  static String formatDate(String date) {
    final DateTime parsedDate = DateFormat('yyyy-MM').parse(date);
    return DateFormat('MMMM yyyy').format(parsedDate);
  }

  static String formatLeagueDate(String date) {
    final DateTime parsedDate = DateFormat('yyyy-MM-DD').parse(date);
    return DateFormat('d MMMM yyyy').format(parsedDate);
  }

  static String shortenName(String name) {
    if (name.length <= 20) {
      return name;
    }

    List<String> parts = name.split(' ');

    if (parts.length == 1) {
      return name;
    }

    String shortenedName = '';

    String lastName = parts.last;
    shortenedName += lastName;
    return shortenedName;
  }
}
