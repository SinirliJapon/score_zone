import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:score_zone/model/scorers.dart';
import 'package:score_zone/model/standings.dart';
import 'package:score_zone/services/api_service.dart';
import 'package:score_zone/utils/functions.dart';

class TeamInfoProvider extends ChangeNotifier {
  final ApiService _apiService;
  bool isLoading = false;
  Team? _team;
  Coach? _coach;
  int? _squadSize;
  String? _averageAge;
  String? errorMessage;
  String? _coachAge;
  List<Player>? _teamSquad = [];

  int? get squadSize => _squadSize;
  String? get averageAge => _averageAge;
  String? get coachAge => _coachAge;
  Team? get team => _team;
  Coach? get coach => _coach;
  List<Player>? get teamSquad => _teamSquad;

  TeamInfoProvider(this._apiService);

  Future<void> fetchTeamSquad(String teamId) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final teamResponse = await _apiService.fetchTeam(teamId);
      _team = teamResponse;
      _coach = _team!.coach;
      if (teamResponse.squad != null && teamResponse.squad!.isNotEmpty) {
        _teamSquad = _team!.squad;
        _squadSize = _teamSquad!.length;
        List<int> ages = _teamSquad!.map((player) => int.parse(Functions.calculateAge(player.dateOfBirth).toString())).toList();
        double averageAgeValue = ages.reduce((a, b) => a + b) / _squadSize!;
        _averageAge = averageAgeValue.toStringAsFixed(1);
        _coachAge = Functions.calculateAge(_coach!.dateOfBirth).toString();
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
