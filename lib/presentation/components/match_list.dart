import 'package:flutter/material.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_team_name_container.dart';
import 'package:score_zone/presentation/components/custom_team_score_card.dart';
import 'package:score_zone/presentation/components/match_date_separator.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/utils/styles.dart';

class MatchList extends StatelessWidget {
  final List<Match> matches;
  final bool isScroll;

  const MatchList({Key? key, required this.matches, required this.isScroll}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: matchListPhysics(isScroll),
      itemCount: matches.length,
      separatorBuilder: (context, index) => MatchDateSeparator(match: matches[index], matches: matches, index: index),
      itemBuilder: (context, index) {
        final match = matches[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MatchHeader(index: index, match: match, currentMatchDate: matches[0].utcDate!),
            Card(
              elevation: 6.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomTeamNameContainer(teamTla: match.homeTeam!.tla.toString()),
                    BuildImage(url: match.homeTeam!.crest.toString(), width: 35),
                    CustomTeamScoreCard(match: match),
                    BuildImage(url: match.awayTeam!.crest.toString(), width: 35),
                    CustomTeamNameContainer(teamTla: match.awayTeam!.tla.toString()),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class MatchHeader extends StatelessWidget {
  final int index;
  final Match match;
  final DateTime? currentMatchDate;
  const MatchHeader({required this.index, required this.match, required this.currentMatchDate, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final competitionType = match.competition!.type;
    if (index == 0) {
      if (competitionType == 'CUP') {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MatchDate(currentMatchDate: currentMatchDate),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(matchStage(match), style: Styles.matchHeaderTextStyle()),
            ),
          ],
        );
      }
      return MatchDate(currentMatchDate: currentMatchDate);
    } else {
      return const SizedBox();
    }
  }
}


ScrollPhysics matchListPhysics(bool isScroll) {
  if (isScroll) {
    return const ScrollPhysics();
  } else {
    return const NeverScrollableScrollPhysics();
  }
}

String matchStage(Match match) {
  String formattedStage = match.stage!.toLowerCase().replaceAll('_', ' ');

  String capitalizedStage =
      formattedStage.split(' ').map((word) => word[0].toUpperCase() + word.substring(1)).join(' ');

  return capitalizedStage;
}
