import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/functions.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/provider/team_info_provider.dart';

@RoutePage()
class TeamInfoScreen extends StatelessWidget {
  final String leagueCode;
  final String teamId;

  const TeamInfoScreen({Key? key, required this.leagueCode, required this.teamId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TeamInfoProvider>(context, listen: false).fetchTeamSquad(teamId);
    });

    return Consumer<TeamInfoProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (value.errorMessage != null) {
        return Center(child: Text(value.errorMessage!));
      } else if (value.teamSquad!.isEmpty) {
        return const Center(child: Text('No team info available...'));
      } else {
        return Scaffold(
          backgroundColor: leagueColors[leagueCode] ?? Colors.grey,
          appBar: AppBar(
            foregroundColor: leagueTextColors[leagueCode] ?? Colors.black,
            backgroundColor: leagueColors[leagueCode]?.withOpacity(0.8) ?? Colors.grey,
            title: Text(value.teamName),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: TeamSquad(leagueCode: leagueCode, teamSquad: value.teamSquad!),
          ),
        );
      }
    });
  }
}

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
          DataColumn(label: Text('No')),
          DataColumn(label: Text('Player')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Nationality')),
        ],
        rows: teamSquad.map((player) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(player.shirtNumber.toString())),
              DataCell(PlayerInfoCell(player: player)),
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
  const PlayerInfoCell({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(Functions.shortenName(player.name.toString())),
        Text(player.position.toString()),
      ],
    );
  }
}
