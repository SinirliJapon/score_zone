import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';

//TODO: Refactor all styles

abstract class Styles {
  static MaterialStateProperty<Color?>? customDataHeadingRowColor(String leagueCode) =>
      MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) => leagueTextColors[leagueCode]);

  static TextStyle customDataTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontWeight: FontWeight.w900);

  static TextStyle customDataPointTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontWeight: FontWeight.w900, fontSize: 16);    

  static TextStyle customHeadingTextStyle(String leagueCode) =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: leagueColors[leagueCode]);

  static TextStyle customMatchTeamTextStyle(String leagueCode) =>
      TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: leagueColors[leagueCode]);    

  static TextStyle customMatchResultTextStyle(String leagueCode) =>
      TextStyle(color: leagueTextColors[leagueCode], fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle customLiveMatchResultTextStyle(String leagueCode) =>
      const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900);   

  static TextStyle customNotFinishedMatchResultTextStyle(String leagueCode) =>
      TextStyle(color: leagueColors[leagueCode], fontSize: 18, fontWeight: FontWeight.w900);        

}
