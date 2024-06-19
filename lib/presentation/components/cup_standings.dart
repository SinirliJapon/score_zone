import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:score_zone/utils/colors.dart';
import 'package:score_zone/utils/styles.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/average_text.dart';
import 'package:score_zone/presentation/components/build_image.dart';

class CupStandings extends StatelessWidget {
  final List<StandingsData> standingsData;
  final String leagueCode;

  const CupStandings(this.standingsData, {Key? key, required this.leagueCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenHeight = constraints.maxHeight;
        final screenWidth = constraints.maxWidth;
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth / 25),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1 / 2.5,
                height: screenHeight > 680 ? (screenHeight - 60) : screenHeight,
                viewportFraction: 0.5,
                scrollDirection: Axis.vertical,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
              ),
              items: standingsData.map((groupStandings) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight / 50),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        GroupNameContainer(groupStandings: groupStandings, screenHeight: screenHeight),
                        DataTable(
                          columnSpacing: screenWidth / 40,
                          dataRowMinHeight: screenHeight / 20,
                          border: const TableBorder(top: BorderSide(color: standingsScreenColor)),
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
                          rows: groupStandings.table.map((data) {
                            return DataRow(
                              cells: <DataCell>[
                                DataCell(Text(data.position.toString())),
                                DataCell(TeamImage(data: data)),
                                DataCell(Text(data.playedGames.toString())),
                                DataCell(Text(data.won.toString())),
                                DataCell(Text(data.draw.toString())),
                                DataCell(Text(data.lost.toString())),
                                DataCell(AverageText(goalDifference: data.goalDifference)),
                                DataCell(
                                    Text(data.points.toString(), style: Styles.customDataPointTextStyle(leagueCode))),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}

class GroupNameContainer extends StatelessWidget {
  final StandingsData groupStandings;
  final double screenHeight;

  const GroupNameContainer({
    Key? key,
    required this.groupStandings,
    required this.screenHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight / 15,
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
      BuildImage(url: data.team.crest!),
      const SizedBox(width: 5),
      Text(data.team.tla!.toUpperCase()),
    ]);
  }
}
