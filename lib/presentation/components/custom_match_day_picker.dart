import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:score_zone/constants/colors.dart';
import 'package:score_zone/provider/league_matches_provider.dart';

class CustomMatchDayPicker extends StatelessWidget {
  final LeagueMatchesProvider value;
  final String leagueCode;
  final int totalMatchDays;
  const CustomMatchDayPicker({super.key, required this.value, required this.leagueCode, required this.totalMatchDays});

  @override
  Widget build(BuildContext context) {
    final foregroundColor = leagueColors[leagueCode] ?? Colors.grey;
    final backgroundColor = leagueTextColors[leagueCode]?.withOpacity(0.8) ?? Colors.black;
    final provider = Provider.of<LeagueMatchesProvider>(context, listen: false);
    return DropdownButton<int>(
      itemHeight: 48.0,
      menuMaxHeight: 300,
      underline: const SizedBox(),
      dropdownColor: foregroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18, color: backgroundColor),
      value: value.currentMatchday,
      items: List.generate(
        38,
        (index) => DropdownMenuItem<int>(value: index + 1, child: Text('${index + 1}')),
      ),
      onChanged: (int? newMatchday) {
        if (newMatchday != null) {
          provider.fetchMatchesForCurrentMatchday(leagueCode, newMatchday.toString());
        }
      },
    );
  }
}