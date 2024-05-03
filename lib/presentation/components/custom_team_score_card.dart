import 'package:flutter/material.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/constants/styles.dart';
import 'package:score_zone/model/match.dart';

class CustomTeamScoreCard extends StatelessWidget {
  const CustomTeamScoreCard({
    Key? key,
    required this.leagueCode,
    required this.match,
  }) : super(key: key);

  final String leagueCode;
  final Match match;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: match.status == "FINISHED"
            ? Text(
                '${match.score?.fullTime?['home'] ?? 0} : ${match.score?.fullTime?['away'] ?? 0}',
                style: Styles.customMatchResultTextStyle(leagueCode),
              )
            : Text('-  :  -', style: Styles.customMatchResultTextStyle(leagueCode)),
      ),
    );
  }
}
