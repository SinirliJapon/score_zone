import 'package:flutter/material.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/average_text.dart';
import 'package:score_zone/presentation/components/build_image.dart';

class CupStandings extends StatelessWidget {
  final List<StandingsData> standingsData;

  const CupStandings(this.standingsData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: standingsData.length,
            itemBuilder: (BuildContext context, int index) {
              final groupStandings = standingsData[index];
              return GroupContainer(groupStandings);
            },
            separatorBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ),
    );
  }
}

class GroupContainer extends StatelessWidget {
  final StandingsData groupStandings;

  const GroupContainer(this.groupStandings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GroupName(groupStandings: groupStandings),
        DataTable(
          horizontalMargin: 20,
          columnSpacing: 10,
          border: const TableBorder(bottom: BorderSide(color: standingsScreenColor, width: 0.5)),
          headingRowColor: Styles.headingDataRowColor(),
          headingTextStyle: Styles.headingTextStyle(),
          dataTextStyle: Styles.dataTextStyle(),
          dataRowColor: Styles.dataRowColor(),
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
          rows: groupStandings.table.map(
            (data) {
              return DataRow(
                cells: <DataCell>[
                  DataCell(Text(data.position.toString())),
                  DataCell(TeamImage(data: data)),
                  DataCell(Text(data.playedGames.toString())),
                  DataCell(Text(data.won.toString())),
                  DataCell(Text(data.draw.toString())),
                  DataCell(Text(data.lost.toString())),
                  DataCell(AverageText(goalDifference: data.goalDifference)),
                  DataCell(Text(data.points.toString(), style: Styles.dataPointTextStyle())),
                ],
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

class GroupName extends StatelessWidget {
  final StandingsData groupStandings;

  const GroupName({
    Key? key,
    required this.groupStandings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          "${groupStandings.group}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: standingsScreenColor,
          ),
        ),
      ),
    );
  }
}

class TeamImage extends StatelessWidget {
  const TeamImage({
    super.key,
    required this.data,
  });

  final TableData data;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      BuildImage(url: data.team.crest!, width: 30),
      const SizedBox(width: 5),
      Text(data.team.tla!.toUpperCase()),
    ]);
  }
}
