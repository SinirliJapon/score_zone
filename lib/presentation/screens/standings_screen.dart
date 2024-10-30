import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/presentation/components/standings%20screen/cup_view.dart';
import 'package:score_zone/presentation/components/standings%20screen/league_view.dart';
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
    return Consumer<StandingsProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.standings.isEmpty) {
          return const Center(child: Text('No standings available...'));
        } else {
          final competitionType = value.competitionType.toString();
          final competitionGroup = value.standings.first.group;
          if (competitionType == 'LEAGUE') {
            return LeagueView(value: value);
          } else {
            if (competitionGroup == "League phase") {
              return LeagueView(value: value);
            } else {
              return CupView(value: value);
            }
          }
        }
      },
    );
  }
}
