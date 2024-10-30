import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:score_zone/utils/colors.dart';

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

  static String averageText(int goalDifference) {
    if (goalDifference == 0) {
      return ' $goalDifference';
    } else {
      return goalDifference > 0 ? '+$goalDifference' : goalDifference.toString();
    }
  }

  static String formatDate(String date) {
    if (date == "Unknown") {
      return "Unknown";
    } else {
      final DateTime parsedDate = DateFormat('yyyy-MM').parse(date);
      return DateFormat('MMMM yyyy').format(parsedDate);
    }
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

  static void showPopup(BuildContext context, String title, String details) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: AlertDialog(
            title: Text(title),
            content: Text(details),
            titlePadding: const EdgeInsets.all(20),
            contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            titleTextStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: primaryText),
            contentTextStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: primaryText),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            backgroundColor: premierSecondary,
            alignment: Alignment.center,
            elevation: 2,
          ),
        );
      },
    );
  }
}
