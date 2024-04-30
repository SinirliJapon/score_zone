import 'package:flutter/material.dart';
import 'package:score_zone/constants/colors.dart';

abstract class Styles {
  static MaterialStateProperty<Color?>? customDataHeadingRowColor(String leagueCode) =>
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => leagueTextColors[leagueCode]);

  static TextStyle customDataTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontWeight: FontWeight.w900);

  static TextStyle customDataPointTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontWeight: FontWeight.w900, fontSize: 16);    

  static TextStyle customHeadingTextStyle(String leagueCode) =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: leagueColors[leagueCode]);

}
