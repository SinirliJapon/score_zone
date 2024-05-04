import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    if (match.status == "FINISHED") {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${match.score?.fullTime?['home'] ?? 0}  -  ${match.score?.fullTime?['away'] ?? 0}',
            style: Styles.customMatchResultTextStyle(leagueCode),
          ),
        ),
      );
    } else if (match.status == "IN_PLAY") {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${match.score?.fullTime?['home'] ?? 0}  -  ${match.score?.fullTime?['away'] ?? 0}',
            style: Styles.customLiveMatchResultTextStyle(leagueCode),
          ),
        ),
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: BorderSide(color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            DateFormat('HH:mm').format(match.utcDate!),
            style: Styles.customNotFinishedMatchResultTextStyle(leagueCode),
          ),
        ),
      );
    }
  }
}
