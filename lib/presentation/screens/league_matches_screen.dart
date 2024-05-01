import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/constants/styles.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/provider/league_matches_provider.dart';

@RoutePage()
class LeagueMatchesScreen extends StatelessWidget {
  final String leagueCode;
  const LeagueMatchesScreen({Key? key, required this.leagueCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeagueMatchesProvider>(context, listen: false).fetchMatchesForCurrentMatchday(leagueCode);
    });
    return Consumer<LeagueMatchesProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.matches.isEmpty) {
          return const Center(child: Text('No league matches available...'));
        } else {
          final matches = value.matches.reversed.toList();
          final String matchday = matches.first.matchday.toString();
          return Scaffold(
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            appBar: AppBar(
              foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
              backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
              title: Text('Matchday $matchday'),
            ),
            body: ListView.builder(
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return Card(
                  elevation: 6.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: Text(match.homeTeam!.tla.toString(), style: Styles.customMatchTeamTextStyle(leagueCode)))),
                        SizedBox(child: BuildImage(url: match.homeTeam!.crest.toString())),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                          color: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '${match.score?.fullTime?['home'] ?? 0} - ${match.score?.fullTime?['away'] ?? 0}',
                              style: Styles.customMatchResultTextStyle(leagueCode),
                            ),
                          ),
                        ),
                        BuildImage(url: match.awayTeam!.crest.toString()),
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: Text(match.awayTeam!.tla.toString(), style: Styles.customMatchTeamTextStyle(leagueCode)))),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
