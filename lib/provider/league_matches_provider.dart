import 'package:flutter/material.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/services/api_service.dart';

class LeagueMatchesProvider extends ChangeNotifier {
  final ApiService _apiService;

  LeagueMatchesProvider(this._apiService);

  bool isLoading = false;
  int _currentMatchday = 1;
  int _totalMatchDay = 46;

  List<Match> _currentMatches = [];
  List<Match> get matches => _currentMatches;

  int get currentMatchday => _currentMatchday;
  int get totalMatchDay => _totalMatchDay;

  Future<void> fetchMatchesForCurrentMatchday(String leagueCode, String currentMatchDay) async {
    isLoading = true;
    notifyListeners();
    // All matches called and filtered after
    try {
      final totalMatchResponse = await _apiService.fetchCurrentMatches(leagueCode);
      _currentMatches =
          totalMatchResponse.matches.where((match) => match.matchday == int.parse(currentMatchDay)).toList();
      _currentMatchday = int.parse(currentMatchDay);
      _totalMatchDay = totalMatchResponse.matches.last.matchday!;
      if (_totalMatchDay == 0) {
        _totalMatchDay = totalMatchResponse.matches.first.season!.currentMatchday!;
      }
      print('Current: $_currentMatchday');
      print('Total: $_totalMatchDay');
    } catch (e) {
      throw Exception('Failed to fetch league matches: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
