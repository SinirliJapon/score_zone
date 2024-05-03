import 'package:flutter/material.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/services/api_service.dart';

class StandingsProvider extends ChangeNotifier {
  final ApiService _apiService;
  late bool isLoading = false;

  List<StandingsData> _standingsTable = [];
  List<StandingsData> get standings => _standingsTable;
  String competitionName = '';
  String competitionType = '';
  String competitionCode = '';
  int currentMatchDay = 0;

  StandingsProvider(this._apiService);

  Future<void> getStandings(String leagueCode) async {
    isLoading = true;
    notifyListeners();

    final standingsResponse = await _apiService.fetchStandings(leagueCode);
    try {
      _standingsTable = standingsResponse.standings;
      currentMatchDay = standingsResponse.season.currentMatchday!;
      competitionName = standingsResponse.competition.name!;
      competitionType = standingsResponse.competition.type!;
      competitionCode = standingsResponse.competition.code!;
    } catch (e) {
      throw Exception('Failed to fetch standings: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
