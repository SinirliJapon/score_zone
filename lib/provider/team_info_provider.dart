import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/services/api_service.dart';

class TeamInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool isLoading = false;
  String? errorMessage;

  String teamName = '';

  List<Player>? _teamSquad = [];
  List<Player>? get teamSquad => _teamSquad;

  TeamInfoProvider(this._apiService);

  Future<void> fetchTeamSquad(String teamId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await _apiService.fetchTeam(teamId);
      if (response.squad != null && response.squad!.isNotEmpty) {
        _teamSquad = response.squad!;
        teamName = response.name!;
        errorMessage = null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        errorMessage = "Error: ${e.response!.statusCode}";
      } else {
        errorMessage = "Error: ${e.message}";
      }
      _teamSquad = null;
    } catch (e) {
      errorMessage = 'Failed to fetch squad: $e';
      _teamSquad = null;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}

class PlayerInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  late bool isLoading = false;
  late String? errorMessage;

  List<Scorer> _scorerTable = [];
  List<Scorer> get scorers => _scorerTable;

  PlayerInfoProvider(this._apiService);

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
