import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/utils/styles.dart';

class MatchDateSeparator extends StatelessWidget {
  final Match match;
  final List<Match> matches;
  final int index;

  const MatchDateSeparator({
    Key? key,
    required this.match,
    required this.matches,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentMatchDate = match.utcDate;
    final currentMatchDay = currentMatchDate!.day;
    final previousMatchDay = index > 0 ? matches[index - 1].utcDate!.day : currentMatchDay;

    if (currentMatchDay != previousMatchDay) {
      return MatchDate(currentMatchDate: currentMatchDate);
    } else {
      return const SizedBox.shrink();
    }
  }
}

class MatchDate extends StatelessWidget {
  final DateTime? currentMatchDate;
  const MatchDate({super.key, required this.currentMatchDate});

  @override
  Widget build(BuildContext context) {
    final day = DateFormat('EEEE').format(currentMatchDate!);
    final date = DateFormat('d MMMM').format(currentMatchDate!);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Text('$day, $date', style: Styles.matchHeaderTextStyle()),
    );
  }
}
