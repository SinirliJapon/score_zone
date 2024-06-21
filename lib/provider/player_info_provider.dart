import 'package:flutter/material.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/services/api_service.dart';

class PlayerInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool isLoading = false;
  String? errorMessage;

  Player? _player;
  Player? get player => _player;

  PlayerInfoProvider(this._apiService);

  Future<void> fetchPlayerInfo(String leagueCode) async {
    isLoading = true;
    notifyListeners();
    final playerResponse = await _apiService.fetchPlayer(leagueCode);
    try {
      
      _player = playerResponse;
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Failed to fetch player: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
