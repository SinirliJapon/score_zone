import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/constants/styles.dart';
import 'package:score_zone/presentation/components/custom_data_row.dart';
import 'package:score_zone/presentation/screens/standings_screen.dart';
import 'package:score_zone/provider/player_stats_provider.dart';

@RoutePage()
class PlayerStatsScreen extends StatelessWidget {
  const PlayerStatsScreen({super.key, required this.leagueCode, required this.leagueTitle});
  final String leagueCode;
  final String leagueTitle;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PlayerStatsProvider>(context, listen: false).fetchScorers(leagueCode);
    });
    return Consumer<PlayerStatsProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.scorers.isEmpty) {
          return const Center(child: Text('No scorers available...'));
        } else {
          final leagueScorersTable = value.scorers;
          return Scaffold(
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            appBar: AppBar(
              foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
              backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
              title: LeaugeTitle(leagueCode: leagueCode, competitionName: leagueTitle),
            ),
            body: DataTable(
              columnSpacing: screenHeight / 39,
              headingRowColor: Styles.customDataHeadingRowColor(leagueCode),
              headingTextStyle: Styles.customHeadingTextStyle(leagueCode),
              dataTextStyle: Styles.customDataTextStyle(leagueCode),
              columns: const <DataColumn>[
                DataColumn(label: Text('POS')),
                DataColumn(label: Text('NAME')),
                DataColumn(label: Text('CLUB')),
                DataColumn(label: Text('A')),
                DataColumn(label: Text('P')),
                DataColumn(label: Text('G')),
              ],
              rows: leagueScorersTable.map((scorer) {
                final index = leagueScorersTable.indexOf(scorer) + 1;
                final teamCrest = scorer.team!.crest.toString();
                final teamTla = scorer.team!.tla!.toUpperCase();
                return DataRow(
                  cells: [
                    DataCell(Text('$index')),
                    DataCell(Text(scorer.player!.name!)),
                    DataCell(CustomDataRow(teamCrest: teamCrest, teamTla: teamTla)),
                    DataCell(Text('${scorer.assists}')),
                    DataCell(Text('${scorer.penalties}')),
                    DataCell(Text('${scorer.goals}', style: Styles.customDataPointTextStyle(leagueCode))),
                  ],
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }
}
