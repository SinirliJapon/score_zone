import 'package:flutter/material.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/services/api_service.dart';

class StandingsProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool _isLoading = false;
  List<StandingsData> _standingsTable = [];
  List<StandingsData> get standings => _standingsTable;
  String? _competitionName;
  String? _competitionType;
  String? _competitionCode;
  Season? _season;
  Area? _area;
  int _currentMatchDay = 0;

  bool get isLoading => _isLoading;
  String? get competitionName => _competitionName;
  String? get competitionType => _competitionType;
  String? get competitionCode => _competitionCode;
  int? get currentMatchDay => _currentMatchDay;
  Season? get season => _season;
  Area? get area => _area;

  StandingsProvider(this._apiService);

  Future<void> getStandings(String leagueCode) async {
    _isLoading = true;
    notifyListeners();

    final standingsResponse = await _apiService.fetchStandings(leagueCode);
    try {
      _standingsTable = standingsResponse.standings;
      _currentMatchDay = standingsResponse.season.currentMatchday!;
      _competitionName = standingsResponse.competition.name!;
      _competitionType = standingsResponse.competition.type!;
      _competitionCode = standingsResponse.competition.code!;
      _area = standingsResponse.area;
      _season = standingsResponse.season;
    } catch (e) {
      throw Exception('Failed to fetch standings: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
