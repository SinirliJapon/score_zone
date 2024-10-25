import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/presentation/components/custom_data_row.dart';
import 'package:score_zone/provider/player_stats_provider.dart';

@RoutePage()
class PlayerStatsScreen extends StatelessWidget {
  const PlayerStatsScreen({super.key, required this.leagueCode, required this.leagueTitle});
  final String leagueCode;
  final String leagueTitle;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
            appBar: AppBar(
              foregroundColor: secondaryText,
              backgroundColor: playerStatsScreenColor,
              title: Text(leagueTitle),
              titleTextStyle: const TextStyle(color: secondaryText, fontWeight: FontWeight.w700, fontSize: 18),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                width: screenWidth,
                child: DataTable(
                  horizontalMargin: 20,
                  columnSpacing: 10,
                  border: const TableBorder(
                    top: BorderSide(color: primaryText, width: 0.5),
                    bottom: BorderSide(color: primaryText, width: 0.5),
                    left: BorderSide(color: primaryText, width: 0.5),
                    right: BorderSide(color: primaryText, width: 0.5),
                  ),
                  showBottomBorder: true,
                  dataRowColor: Styles.dataRowColor(),
                  dataTextStyle: Styles.dataTextStyle(),
                  headingRowColor: Styles.headingPlayerDataRowColor(),
                  headingTextStyle: Styles.headingTextStyle(),
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
                    final teamId = scorer.team!.id.toString();
                    return DataRow(
                      cells: [
                        DataCell(Text('$index')),
                        DataCell(Text(scorer.player!.name!)),
                        DataCell(CustomDataRow(
                            teamCrest: teamCrest, teamTla: teamTla, teamId: teamId, leagueName: leagueCode)),
                        DataCell(Text('${scorer.assists}')),
                        DataCell(Text('${scorer.penalties}')),
                        DataCell(Text('${scorer.goals}', style: Styles.dataPointTextStyle())),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
