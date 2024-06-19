import 'package:flutter/material.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/average_text.dart';
import 'package:score_zone/presentation/components/custom_data_row.dart';

class LeagueStandings extends StatelessWidget {
  final List<TableData> standingsTable;
  final String leagueCode;

  const LeagueStandings(this.standingsTable, this.leagueCode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: screenWidth,
        child: DataTable(
          columnSpacing: 5,
          showBottomBorder: true,
          headingRowColor: Styles.customDataHeadingRowColor(leagueCode),
          headingTextStyle: Styles.customHeadingTextStyle(leagueCode),
          dataTextStyle: Styles.customDataTextStyle(leagueCode),
          columns: const <DataColumn>[
            DataColumn(label: Text('POS')),
            DataColumn(label: Text('CLUB')),
            DataColumn(label: Text('PL')),
            DataColumn(label: Text('W')),
            DataColumn(label: Text('D')),
            DataColumn(label: Text('L')),
            DataColumn(label: Text('GD')),
            DataColumn(label: Text('PTS')),
          ],
          rows: standingsTable.map((data) {
            final teamCrest = data.team.crest.toString();
            final teamTla = data.team.tla!.toUpperCase();
            final teamId = data.team.id.toString();
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(data.position.toString())),
                DataCell(CustomDataRow(teamCrest: teamCrest, teamTla: teamTla, teamId: teamId, leagueCode: leagueCode)),
                DataCell(Text(data.playedGames.toString())),
                DataCell(Text(data.won.toString())),
                DataCell(Text(data.draw.toString())),
                DataCell(Text(data.lost.toString())),
                DataCell(AverageText(goalDifference: data.goalDifference)),
                DataCell(Text(data.points.toString(), style: Styles.customDataPointTextStyle(leagueCode))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
