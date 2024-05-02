import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/constants/styles.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/presentation/components/build_image.dart';
import 'package:score_zone/provider/league_matches_provider.dart';

//TODO: Fix the dropdown menu

@RoutePage()
class LeagueMatchesScreen extends StatelessWidget {
  final String currentMatchDay;
  final String leagueCode;
  const LeagueMatchesScreen({Key? key, required this.leagueCode, required this.currentMatchDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LeagueMatchesProvider>(context, listen: false)
          .fetchMatchesForCurrentMatchday(leagueCode, currentMatchDay);
    });

    return Consumer<LeagueMatchesProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.matches.isEmpty) {
          return const Center(child: Text('No league matches available...'));
        } else {
          final matches = value.matches.reversed.toList();
          return Scaffold(
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            appBar: AppBar(
              foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
              backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
              title: const Text('League Match Day:'),
              actions: [
                CustomMatchDayPicker(value: value, leagueCode: leagueCode, totalMatchDays: 38),
              ],
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
                        CustomTeamNameContainer(teamTla: match.homeTeam!.tla.toString(), leagueCode: leagueCode),
                        BuildImage(url: match.homeTeam!.crest.toString()),
                        CustomTeamScoreCard(leagueCode: leagueCode, match: match),
                        BuildImage(url: match.awayTeam!.crest.toString()),
                        CustomTeamNameContainer(teamTla: match.awayTeam!.tla.toString(), leagueCode: leagueCode),
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

class CustomMatchDayPicker extends StatelessWidget {
  final LeagueMatchesProvider value;
  final String leagueCode;
  final int totalMatchDays; 
  const CustomMatchDayPicker({super.key, required this.value, required this.leagueCode, required this.totalMatchDays});

  @override
  Widget build(BuildContext context) {
    final foregroundColor = leagueColors[leagueCode] ?? Colors.grey;
    final backgroundColor = leagueTextColors[leagueCode]?.withOpacity(0.8) ?? Colors.black;
    final provider = Provider.of<LeagueMatchesProvider>(context, listen: false);
    return DropdownButton<int>(
      itemHeight: 48.0,
      menuMaxHeight: 300,
      underline: const SizedBox(),
      dropdownColor: foregroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: backgroundColor),
      value: value.currentMatchday,
      items: List.generate(
        38,
        (index) => DropdownMenuItem<int>(value: index + 1, child: Text('${index + 1}')),
      ),
      onChanged: (int? newMatchday) {
        if (newMatchday != null) {
          provider.fetchMatchesForCurrentMatchday(leagueCode, newMatchday.toString());
        }
      },
    );
  }
}




int calculateMatchDay(String leagueCode) {
  switch (leagueCode) {
    case 'WC':
      return 8;
    case 'CLI':
      return 14;
    case 'EC':
    case 'CL':
      return 20;
    case 'PPL':
    case 'FL1':
    case 'DED':
    case 'BL1':
      return 34;
    case 'SA':
    case 'PD':
    case 'BSA':
    case 'PL':
      return 38;
    case 'ELC':
      return 46;
    default:
      return 38;
  }
}

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
        child: Text(
          '${match.score?.fullTime?['home'] ?? 0} - ${match.score?.fullTime?['away'] ?? 0}',
          style: Styles.customMatchResultTextStyle(leagueCode),
        ),
      ),
    );
  }
}

class CustomTeamNameContainer extends StatelessWidget {
  final String teamTla;
  final String leagueCode;
  const CustomTeamNameContainer({
    Key? key,
    required this.teamTla,
    required this.leagueCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Center(child: Text(teamTla, style: Styles.customMatchTeamTextStyle(leagueCode))),
    );
  }
}
