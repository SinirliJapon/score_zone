import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/custom_data_row.dart';

class LeagueStandings extends StatelessWidget {
  final List<TableData> standingsTable;
  final String leagueName;

  const LeagueStandings(this.standingsTable, this.leagueName, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
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
          headingRowColor: Styles.headingDataRowColor(),
          headingTextStyle: Styles.headingTextStyle(),
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
                DataCell(CustomDataRow(teamCrest: teamCrest, teamTla: teamTla, teamId: teamId, leagueName: leagueName)),
                DataCell(Text(data.playedGames.toString())),
                DataCell(Text(data.won.toString())),
                DataCell(Text(data.draw.toString())),
                DataCell(Text(data.lost.toString())),
                DataCell(Text(Functions.averageText(data.goalDifference))),
                DataCell(Text(data.points.toString(), style: const TextStyle(fontSize: 16))),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
