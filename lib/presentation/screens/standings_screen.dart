import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/presentation/components/cup_standings.dart';
import 'package:score_zone/presentation/components/league_standings.dart';
import 'package:score_zone/provider/standings_provider.dart';

@RoutePage()
class StandingsScreen extends StatefulWidget {
  final String leagueCode;

  const StandingsScreen({Key? key, required this.leagueCode}) : super(key: key);

  @override
  State<StandingsScreen> createState() => _StandingsScreenState();
}

class _StandingsScreenState extends State<StandingsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<StandingsProvider>(context, listen: false).getStandings(widget.leagueCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: leagueColors[widget.leagueCode] ?? Colors.grey,
      appBar: AppBar(
          backgroundColor: leagueColors[widget.leagueCode]?.withOpacity(0.8) ?? Colors.grey,
          title: Consumer<StandingsProvider>(builder: (context, value, child) {
            return Center(
                child: Text(
              value.competitionName,
              style: TextStyle(color: leagueTextColors[widget.leagueCode] ?? Colors.black, fontWeight: FontWeight.w700),
            ));
          })),
      body: Consumer<StandingsProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (value.standings.isEmpty) {
            return const Center(child: Text('No standings available.'));
          } else {
            final leagueCode = widget.leagueCode;
            final leagueStandingsTable = value.standings.first.table;
            final cupStandings = value.standings;
            if (value.competitionType.toString() == 'LEAGUE') {}
            return value.competitionType.toString() == 'LEAGUE' ? LeagueStandings(leagueStandingsTable, leagueCode) : CupStandings(cupStandings);
          }
        },
      ),
    );
  }
}
