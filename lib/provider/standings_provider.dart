import 'package:flutter/material.dart';
import 'package:score_zone/model/area.dart';
import 'package:score_zone/model/season.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/services/api_service.dart';
import 'package:score_zone/utils/functions.dart';

class StandingsProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool _isLoading = false;
  int _currentMatchDay = 0;

  String? _competitionName;
  String? _competitionType;
  String? _competitionCode;
  String? _competitionEmblem;
  String? _competitionStartDate;
  String? _competitionEndDate;
  Season? _season;
  Area? _area;
  List<StandingsData> _standingsTable = [];

  bool get isLoading => _isLoading;
  String? get competitionName => _competitionName;
  String? get competitionType => _competitionType;
  String? get competitionCode => _competitionCode;
  String? get competitionEmblem => _competitionEmblem;
  String? get competitionStartDate => _competitionStartDate;
  String? get competitionEndDate => _competitionEndDate;
  int? get currentMatchDay => _currentMatchDay;
  Season? get season => _season;
  Area? get area => _area;
  List<StandingsData> get standings => _standingsTable;

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
      _competitionEmblem = standingsResponse.competition.emblem!;
      _competitionStartDate = Functions.formatLeagueDate(standingsResponse.season.startDate!);
      _competitionEndDate = Functions.formatLeagueDate(standingsResponse.season.endDate!);
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
