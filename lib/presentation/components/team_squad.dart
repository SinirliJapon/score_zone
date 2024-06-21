import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/styles.dart';

class TeamSquad extends StatelessWidget {
  final String leagueCode;
  final List<Player> teamSquad;

  const TeamSquad({
    Key? key,
    required this.leagueCode,
    required this.teamSquad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: DataTable(
        headingRowColor: Styles.customDataHeadingRowColor(leagueCode),
        headingTextStyle: Styles.customHeadingTextStyle(leagueCode),
        dataTextStyle: Styles.customDataTextStyle(leagueCode),
        border: const TableBorder(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
          left: BorderSide(color: Colors.grey, width: 0.5),
          right: BorderSide(color: Colors.grey, width: 0.5),
          horizontalInside: BorderSide(color: Colors.grey, width: 0.5),
          verticalInside: BorderSide(color: Colors.grey, width: 0.5),
        ),
        horizontalMargin: 20,
        columnSpacing: 5,
        columns: const <DataColumn>[
          DataColumn(label: Text('Player')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Nationality')),
        ],
        rows: teamSquad.map((player) {
          return DataRow(
            cells: <DataCell>[
              DataCell(PlayerInfoCell(leagueCode: leagueCode, player: player)),
              DataCell(Text(Functions.calculateAge(player.dateOfBirth))),
              DataCell(Text(player.nationality.toString())),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PlayerInfoCell extends StatelessWidget {
  final Player player;
  final String leagueCode;
  const PlayerInfoCell({super.key,  required this.leagueCode, required this.player,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(PlayerInfoRoute(leagueCode: leagueCode, playerId: player.id.toString(), )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(Functions.shortenName(player.name.toString())),
          Text(player.position.toString()),
        ],
      ),
    );
  }
}