import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';
//TODO: Refactor all styles

abstract class Styles {
  static WidgetStateProperty<Color?>? dataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => Colors.white);

  static TextStyle dataTextStyle() =>
      const TextStyle(color: premierPrimary, fontWeight: FontWeight.w900);

  static TextStyle dataPointTextStyle() =>
      const TextStyle(color: premierPrimary, fontWeight: FontWeight.w900, fontSize: 16);

  static WidgetStateProperty<Color?>? headingDataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => premierPrimary);    

  static TextStyle headingTextStyle() =>
      const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: Colors.white);

  static TextStyle matchTeamTextStyle(String leagueCode) =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: leagueColors[leagueCode]);

  static TextStyle matchResultTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle liveMatchResultTextStyle(String leagueCode) =>
      const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle notFinishedMatchResultTextStyle(String leagueCode) =>
      TextStyle(color: leagueColors[leagueCode], fontSize: 18, fontWeight: FontWeight.w900);
}
