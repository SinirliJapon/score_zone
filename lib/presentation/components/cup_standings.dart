import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/presentation/components/team_image.dart';

class CupStandings extends StatelessWidget {
  final List<StandingsData> standingsData;

  const CupStandings(this.standingsData, {Key? key}) : super(key: key);

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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        groupNameContainer(groupStandings, screenHeight),
                        DataTable(
                          columnSpacing: screenWidth / 40,
                          dataRowMinHeight: screenHeight / 20,
                          border: const TableBorder(top: BorderSide(color: standingsScreenColor)),
                          headingTextStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14, color: standingsScreenColor),
                          dataTextStyle: const TextStyle(fontWeight: FontWeight.w700, color: standingsScreenColor),
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
                                DataCell(
                                    Row(children: [BuildImage(url: data.team.crest), const SizedBox(width: 5), Text(data.team.tla.toUpperCase())])),
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

  Container groupNameContainer(StandingsData groupStandings, double screenHeight) {
    return Container(
      height: screenHeight / 15,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
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
