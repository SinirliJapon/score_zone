import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';
//TODO: Refactor all styles

abstract class Styles {
  static WidgetStateProperty<Color?>? dataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => secondaryText);

  static TextStyle dataTextStyle() => const TextStyle(color: primaryText, fontWeight: FontWeight.w900);

  static TextStyle dataPointTextStyle() =>
      const TextStyle(color: primaryText, fontWeight: FontWeight.w900, fontSize: 16);

  static WidgetStateProperty<Color?>? headingTeamDataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => teamInfoScreenColor);

  static WidgetStateProperty<Color?>? headingPlayerDataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => playerStatsScreenColor);

  static WidgetStateProperty<Color?>? headingDataRowColor() =>
      WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) => primaryText);

  static TextStyle headingTextStyle() =>
      const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: secondaryText);

  static TextStyle headingTeamTextStyle() =>
      const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: primaryText);

  static TextStyle matchTeamTextStyle() =>
      const TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: primaryText);

  static TextStyle matchResultTextStyle() =>
      const TextStyle(color: secondaryText, fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle liveMatchResultTextStyle() =>
      const TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle notFinishedMatchResultTextStyle() =>
      const TextStyle(color: primaryText, fontSize: 18, fontWeight: FontWeight.w900);

  static TextStyle matchHeaderTextStyle() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: primaryText);
}
