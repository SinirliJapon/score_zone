import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/app_router/app_router.gr.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/utils/colors.dart';
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

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: screenWidth,
        child: DataTable(
          dataRowColor: Styles.dataRowColor(),
          dataTextStyle: Styles.dataTextStyle(),
          headingRowColor: Styles.headingTeamDataRowColor(),
          headingTextStyle: Styles.headingTeamTextStyle(),
          border: TableBorder.all(color: primaryText, width: 0.5),
          horizontalMargin: 20,
          columnSpacing: 20,
          columns: const <DataColumn>[
            DataColumn(label: Text('Player')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Nationality')),
          ],
          rows: teamSquad.map((player) => _buildDataRow(context, player)).toList(),
        ),
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, Player player) {
    return DataRow(
      cells: <DataCell>[
        DataCell(PlayerInfoCell(leagueCode: leagueCode, player: player)),
        DataCell(PlayerAge(player: player)),
        DataCell(Text(player.nationality!)),
      ],
    );
  }
}

class PlayerAge extends StatelessWidget {
  final Player player;

  const PlayerAge({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String age = Functions.calculateAge(player.dateOfBirth).toString();
    return Text(age == '0' ? 'N/A' : age);
  }
}

class PlayerInfoCell extends StatelessWidget {
  final Player player;
  final String leagueCode;

  const PlayerInfoCell({
    Key? key,
    required this.leagueCode,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(PlayerInfoRoute(
        leagueCode: leagueCode,
        playerId: player.id.toString(),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Functions.shortenName(player.name!),
            style: Styles.dataTextStyle().copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            player.position!,
            style: Styles.dataTextStyle().copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
