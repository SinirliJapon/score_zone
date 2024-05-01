import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/presentation/components/cup_standings.dart';
import 'package:score_zone/presentation/components/league_standings.dart';
import 'package:score_zone/provider/standings_provider.dart';

@RoutePage()
class StandingsScreen extends StatelessWidget {
  final String leagueCode;

  const StandingsScreen({Key? key, required this.leagueCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<StandingsProvider>(context, listen: false).getStandings(leagueCode);
    });
    return Consumer<StandingsProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.standings.isEmpty) {
        return const Center(child: Text('No standings available...'));
      } else {
        final leagueStandingsTable = value.standings.first.table;
        final cupStandings = value.standings;
        return Scaffold(
          backgroundColor: leagueColors[leagueCode] ?? Colors.grey,
          appBar: AppBar(
            foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            actions: [
              PlayerStatsScreenButton(leagueCode: leagueCode, leagueTitle: value.competitionName),
              LeagueMatchesScreenButton(leagueCode: leagueCode)
            ],
            // TODO: This is for temporary
            title: LeaugeTitle(leagueCode: leagueCode, competitionName: value.competitionName),
          ),
          body: value.competitionType.toString() == 'LEAGUE'
              ? LeagueStandings(leagueStandingsTable, leagueCode)
              : CupStandings(cupStandings, leagueCode: leagueCode),
        );
      }
    });
  }
}

class LeaugeTitle extends StatelessWidget {
  const LeaugeTitle({
    super.key,
    required this.leagueCode,
    required this.competitionName,
  });

  final String leagueCode;
  final String competitionName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        competitionName,
        style: TextStyle(
          color: leagueTextColors[leagueCode] ?? Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class PlayerStatsScreenButton extends StatelessWidget {
  const PlayerStatsScreenButton({
    super.key,
    required this.leagueCode,
    required this.leagueTitle,
  });

  final String leagueCode;
  final String leagueTitle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => AutoRouter.of(context).push(
              PlayerStatsRoute(leagueCode: leagueCode, leagueTitle: leagueTitle),
            ),
        icon: const Icon(Icons.person));
  }
}

class LeagueMatchesScreenButton extends StatelessWidget {
  const LeagueMatchesScreenButton({
    super.key,
    required this.leagueCode,
  });

  final String leagueCode;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => AutoRouter.of(context).push(
              LeagueMatchesRoute(leagueCode: leagueCode),
            ),
        icon: const Icon(Icons.sports_soccer));
  }
}
