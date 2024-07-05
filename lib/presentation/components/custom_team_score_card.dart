import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/provider/score_opacity_provider.dart';

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
    final isPostponed = match.utcDate!.isBefore(DateTime.now());
    if (match.status == "FINISHED") {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${match.score?.fullTime?['home'] ?? 0}  -  ${match.score?.fullTime?['away'] ?? 0}',
            style: Styles.matchResultTextStyle(leagueCode),
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
          child: AnimatedOpacity(
            opacity: context.watch<ScoreOpacityProvider>().opacityLevel,
            duration: const Duration(seconds: 1),
            child: Text(
              '${match.score?.fullTime?['home'] ?? 0}  -  ${match.score?.fullTime?['away'] ?? 0}',
              style: Styles.liveMatchResultTextStyle(leagueCode),
            ),
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
          child: isPostponed
              ? Text(
                  ' PPD ',
                  style: Styles.notFinishedMatchResultTextStyle(leagueCode),
                )
              : match.utcDate == null
                  ? Text(
                      ' TBD ',
                      style: Styles.notFinishedMatchResultTextStyle(leagueCode),
                    )
                  : Text(
                      DateFormat('HH:mm').format(match.utcDate!),
                      style: Styles.notFinishedMatchResultTextStyle(leagueCode),
                    ),
        ),
      );
    }
  }
}
