import 'package:flutter/material.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/team_image.dart';

class LeagueStandings extends StatelessWidget {
  final List<TableData> standingsTable;
  final String leagueCode;

  const LeagueStandings(this.standingsTable, this.leagueCode, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        columnSpacing: screenHeight / 38,
        headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
          return leagueTextColors[leagueCode];
        }),
        headingTextStyle: TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: leagueColors[leagueCode]),
        dataTextStyle: TextStyle(color: leagueTextColors[leagueCode], fontWeight: FontWeight.w900),
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
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(data.position.toString())),
              DataCell(
                Row(
                  children: [
                    BuildImage(url: data.team.crest),
                    const SizedBox(width: 5),
                    Text(data.team.tla.toUpperCase(), style: const TextStyle(fontWeight: FontWeight.w900))
                  ],
                ),
              ),
              DataCell(Text(data.playedGames.toString())),
              DataCell(Text(data.won.toString())),
              DataCell(Text(data.draw.toString())),
              DataCell(Text(data.lost.toString())),
              DataCell(Text(data.goalDifference > 0 ? '+${data.goalDifference}' : data.goalDifference.toString())),
              DataCell(Text(data.points.toString(), style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14))),
            ],
          );
        }).toList(),
      ),
    );
  }
}
