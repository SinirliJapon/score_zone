import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/presentation/components/custom_match_day_picker.dart';
import 'package:score_zone/presentation/components/custom_team_name_container.dart';
import 'package:score_zone/presentation/components/custom_team_score_card.dart';
import 'package:score_zone/presentation/components/match_date_separator.dart';
import 'package:score_zone/provider/league_matches_provider.dart';

// TODO: Make separate design for cup competitions

@RoutePage()
class LeagueMatchesScreen extends StatelessWidget {
  final String currentMatchDay;
  final String leagueCode;
  const LeagueMatchesScreen({Key? key, required this.leagueCode, required this.currentMatchDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LeagueMatchesProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.fetchMatchesForCurrentMatchday(leagueCode, currentMatchDay);
    });
    return Consumer<LeagueMatchesProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.matches.isEmpty) {
          return const Center(child: Text('No league matches available...'));
        } else {
          final matches = value.matches.toList();
          return Scaffold(
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            appBar: AppBar(
              foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
              backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
              title: const Text('League Match Day:'),
              actions: [
                CustomMatchDayPicker(value: value, leagueCode: leagueCode, totalMatchDays: value.totalMatchDay),
              ],
            ),
            body: ListView.separated(
              itemCount: matches.length,
              separatorBuilder: (context, index) =>
                  MatchDateSeparator(match: matches[index], matches: matches, index: index),
              itemBuilder: (context, index) {
                final match = matches[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    index == 0 ? MatchDate(currentMatchDate: matches[0].utcDate!) : const SizedBox(),
                    Card(
                      elevation: 6.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomTeamNameContainer(teamTla: match.homeTeam!.tla.toString(), leagueCode: leagueCode),
                            BuildImage(url: match.homeTeam!.crest.toString()),
                            CustomTeamScoreCard(leagueCode: leagueCode, match: match),
                            BuildImage(url: match.awayTeam!.crest.toString()),
                            CustomTeamNameContainer(teamTla: match.awayTeam!.tla.toString(), leagueCode: leagueCode),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}

