import 'package:flutter/material.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/services/api_service.dart';

class PlayerStatsProvider extends ChangeNotifier {
  final ApiService _apiService;
  late bool isLoading = false;
  late String? errorMessage;

  List<Scorer> _scorerTable = [];
  List<Scorer> get scorers => _scorerTable;

  PlayerStatsProvider(this._apiService);

  Future<void> fetchScorers(String leagueCode) async {
    isLoading = true;
    notifyListeners();

    final response = await _apiService.fetchScorers(leagueCode);
    try {
      _scorerTable = response.scorers;
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to fetch scorers: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
