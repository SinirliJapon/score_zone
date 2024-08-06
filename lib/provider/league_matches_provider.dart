import 'package:flutter/material.dart';
import 'package:score_zone/model/match.dart';
import 'package:score_zone/services/api_service.dart';

class LeagueMatchesProvider extends ChangeNotifier {
  final ApiService _apiService;

  LeagueMatchesProvider(this._apiService);

  bool _isLoading = false;
  int _desiredMatchDay = 1;
  int _currentMatchDay = 1;
  int _totalMatchDay = 46;

  bool get isLoading => _isLoading;
  List<Match> _desiredMatches = [];
  List<Match> get desiredMatches => _desiredMatches;
  int get desiredMatchDay => _desiredMatchDay;
  int get totalMatchDay => _totalMatchDay;

  Future<void> fetchMatchesForCurrentMatchday(String leagueCode, String desiredMatchDay) async {
    _isLoading = true;
    notifyListeners();
    // All matches called and filtered after
    try {
      final totalMatchResponse = await _apiService.fetchMatches(leagueCode);
      _desiredMatches =
          totalMatchResponse.matches.where((match) => match.matchday == int.parse(desiredMatchDay)).toList();
      _desiredMatchDay = int.parse(desiredMatchDay);
      _currentMatchDay = totalMatchResponse.matches.first.season!.currentMatchday!;
      _totalMatchDay = totalMatchResponse.matches.last.matchday!;
      if (_totalMatchDay < _currentMatchDay) {
        _totalMatchDay = _currentMatchDay;
      }
    } catch (e) {
      throw Exception('Failed to fetch league matches: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
