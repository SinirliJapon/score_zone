import 'package:flutter/material.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/services/api_service.dart';

class LeagueMatchesProvider extends ChangeNotifier {
  final ApiService _apiService;

  LeagueMatchesProvider(this._apiService);

  bool isLoading = false;
  int _currentMatchday = 1;

  List<Match> _matches = [];
  List<Match> get matches => _matches;

  int get currentMatchday => _currentMatchday;

  Future<void> fetchMatchesForCurrentMatchday(String leagueCode) async {
    isLoading = true;
    notifyListeners();

    final matchResponse = await _apiService.fetchMatches(leagueCode);
    try {
      
      final currentMatchDay = calculateCurrentMatchday(matchResponse.matches);
      final currentMatches = matchResponse.matches.where((match) => match.matchday == currentMatchDay).toList();
      _matches = currentMatches;
      _currentMatchday = currentMatchDay;
    } catch (e) {
      throw Exception('Failed to fetch league matches: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  int calculateCurrentMatchday(List<Match> matches) {
    final now = DateTime.now();
    for (int i = matches.length - 1; i >= 0; i--) {
      final matchDate = matches[i].utcDate;
      if (matchDate != null && matchDate.isBefore(now)) {
        return matches[i].matchday ?? 1;
      }
    }
    return 1;
  }

  void navigateToPreviousMatchday(String leagueCode) {
    if (_currentMatchday > 1) {
      _currentMatchday--;
      fetchMatchesForCurrentMatchday(leagueCode);
      notifyListeners();
    }
  }

  void navigateToNextMatchday(String leaguecode) {
    _currentMatchday++;
    fetchMatchesForCurrentMatchday(leaguecode);
    notifyListeners();
  }
}
