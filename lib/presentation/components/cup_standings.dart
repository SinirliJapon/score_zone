import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1 / 2.5,
                height: screenHeight,
                viewportFraction: 0.5,
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: standingsData.map((groupStandings) {
                return StandingsGroupCard(groupStandings);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class StandingsGroupCard extends StatelessWidget {
  final StandingsData groupStandings;

  const StandingsGroupCard(this.groupStandings, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: premierSecondary,
      elevation: 6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            GroupNameContainer(groupStandings: groupStandings),
            DataTable(
              horizontalMargin: 20,
              columnSpacing: 10,
              border: const TableBorder(top: BorderSide(color: standingsScreenColor)),
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
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class GroupNameContainer extends StatelessWidget {
  final StandingsData groupStandings;

  const GroupNameContainer({
    Key? key,
    required this.groupStandings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
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
