import 'package:flutter/material.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/services/api_service.dart';

class LeagueMatchesProvider extends ChangeNotifier {
  final ApiService _apiService;

  LeagueMatchesProvider(this._apiService);

  bool isLoading = false;
  int _currentMatchday = 1;

  List<Match> _currentMatches = [];
  List<Match> get matches => _currentMatches;

  int get currentMatchday => _currentMatchday;

  Future<void> fetchMatchesForCurrentMatchday(String leagueCode, String currentMatchDay) async {
    isLoading = true;
    notifyListeners();

    try {
      final matchResponse = await _apiService.fetchIntendedMatches(leagueCode, currentMatchDay);
      _currentMatches = matchResponse.matches;
      _currentMatchday = int.parse(currentMatchDay);
    } catch (e) {
      throw Exception('Failed to fetch league matches: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
