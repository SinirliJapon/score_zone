import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/provider/score_opacity_provider.dart';

class CustomTeamScoreCard extends StatelessWidget {
  final Match match;
  const CustomTeamScoreCard({Key? key, required this.match}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPostponed = match.utcDate!.isBefore(DateTime.now());
    final homeTeamScore = match.score?.fullTime?['home'];
    final awayTeamScore = match.score?.fullTime?['away'];
    final matchTime = DateFormat('HH:mm').format(match.utcDate!);
    if (match.status == "FINISHED") {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        color: primaryText,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${homeTeamScore ?? 0}  -  ${awayTeamScore ?? 0}',
            style: Styles.matchResultTextStyle(),
          ),
        ),
      );
    } else if (match.status == "IN_PLAY") {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(color: primaryText),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedOpacity(
            opacity: context.watch<ScoreOpacityProvider>().opacityLevel,
            duration: const Duration(seconds: 1),
            child: Text(
              '${homeTeamScore ?? 0}  -  ${awayTeamScore ?? 0}',
              style: Styles.liveMatchResultTextStyle(),
            ),
          ),
        ),
      );
    } else {
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
          side: const BorderSide(color: primaryText),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isPostponed
              ? Text(
                  ' PPD ',
                  style: Styles.notFinishedMatchResultTextStyle(),
                )
              : match.utcDate == null || matchTime == '00:00'
                  ? Text(
                      ' TBD ',
                      style: Styles.notFinishedMatchResultTextStyle(),
                    )
                  : Text(
                      DateFormat('HH:mm').format(match.utcDate!),
                      style: Styles.notFinishedMatchResultTextStyle(),
                    ),
        ),
      );
    }
  }
}
